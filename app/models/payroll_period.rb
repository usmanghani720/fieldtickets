class PayrollPeriod < ActiveRecord::Base
  PER_DIEM_ALLOWANCE = 30.00
  
  has_many :employee_entries, class_name: 'Ticket::EmployeeEntry'
  has_many :employees, -> { unscope(:order).uniq }, through: :employee_entries, class_name: 'Ticket::Employee'
  has_many :tickets, -> { unscope(:order).uniq }, through: :employees, class_name: 'Ticket::Ticket'
  
  # returns tickets that are admin-approved but not attached to a payroll period
  def self.available_tickets
    entries = Ticket::EmployeeEntry.where(payroll_period_id: nil)
    
    pending_tickets = Set.new
    entries.each do |entry|
      if entry.ticket.admin_approved?
        pending_tickets << entry.ticket
      end
    end
    
    pending_tickets
  end
  
  def self.exists_for_date(date)
    PayrollPeriod.where('start_date <= ?', date).where('end_date >= ?', date).count > 0
  end
  
  def per_diems
    result = {}
    
    employees.where(per_diem: true).each do |employee|
      result[employee.id] ||= { name: employee.display_name, count: 0 }
      result[employee.id][employee.entries.first.payroll_worked_date] = true
      result[employee.id][:count] = result[employee.id].count - 2
    end
    
    result
  end
  
  def self.create_with_dates(start_date, end_date)
    pp = PayrollPeriod.create(
      start_date: start_date,
      end_date: end_date
    )
    pp.autoselect_entries!
    pp
  end
  
  def valid_entries
    employee_entries.where('duration > ?', 0)
  end
  
  def summarized_entries
    results = employee_entries.unscope(:order).
      
      select('payroll_category_string, sum(payroll_duration_standard) as payroll_duration_standard, sum(payroll_duration_overtime) as payroll_duration_overtime').
      
      group(:payroll_category_string)
      
    results = results.reject do |result|
      (result.payroll_duration_standard.to_f + result.payroll_duration_overtime.to_f) <= 0
    end
    
    results
    
  end
  
  # Choose the Ticket::EmployeeEntries that belong to this PayrollPeriod
  def autoselect_entries!
    if employee_entries.present?
      raise 'This PayrollPeriod already has employee_entries! Can’t autoselect_entries!'
    end
  
    tickets = Ticket::Ticket.where(first_employee_entry: start_date..end_date)
    tickets.each do |ticket|
      ticket.employee_entries.each do |employee_entry|
        if employee_entry.payroll_period
          raise 'PayrollPeriod.autoselect_entries! was called for a date range that already has payroll data.'
        end
        employee_entry.payroll_period = self
        if not employee_entry.save
          raise employee_entry.errors.inspect
        end
      end
    end
  
    calculate!
  end
  
  # Choose all finalized Ticket::EmployeeEntries that belong to this PayrollPeriod
  def autoselect_all_possible_entries!
    if employee_entries.present?
      raise 'This PayrollPeriod already has employee_entries! Can’t autoselect_entries!'
    end
  
    entries = Ticket::EmployeeEntry.where(payroll_period_id: nil)

    tickets = Set.new
    entries.each do |entry|
      if entry.ticket.admin_approved?
        tickets << entry.ticket
      end
    end
    
    earliest_date = nil
    latest_date = nil

    tickets.each do |ticket|
      ticket.employee_entries.each do |employee_entry|
        if employee_entry.payroll_period
          raise 'autoselect_all_possible_entries! is working on a ticket that already has a payroll period. More nuanced control is required here.'
        end
        
        if (not earliest_date) or (earliest_date > employee_entry.time)
          earliest_date = employee_entry.time
        end
        if (not latest_date) or (latest_date < employee_entry.time)
          latest_date = employee_entry.time
        end
        
        employee_entry.payroll_period = self
        if not employee_entry.save
          raise employee_entry.errors.inspect
        end
      end
    end
    
    self.start_date = earliest_date
    self.end_date = latest_date
    self.save
    
    calculate!
  end

  # Modify Ticket::EmployeeEntries to contain the correct data for payroll
  def calculate!
    # When expanding the application to support multi-week pay periods, this code must be modified
    minutes_this_week = []
    daily_limit = 8 * 60   # in minutes
    weekly_limit = 40 * 60 # in minutes

    entries = employee_entries.reload # TODO: sort logic here    
  
    entries.each do |e|
      duration = e.duration || 0
      date = e.payroll_worked_date = e.ticket.first_employee_entry
      
      minutes_this_week[e.employee_id] ||= { total: 0 }
      minutes_this_week[e.employee_id][date] ||= 0
      minutes_this_week[e.employee_id][date] += duration
      minutes_this_week[e.employee_id][:total] += duration
      
      overtime_today = minutes_this_week[e.employee_id][date] - daily_limit
      overtime_this_week = minutes_this_week[e.employee_id][:total] - weekly_limit
      overtime_max = [overtime_today, overtime_this_week, 0].max
      
      e.payroll_duration_standard = duration - overtime_max
      e.payroll_duration_standard = 0 if e.payroll_duration_standard < 0
      e.payroll_duration_overtime = duration - e.payroll_duration_standard
      
      e.payroll_bill_to = e.ticket.bill_to
      e.payroll_job_id = e.ticket.job_id
      e.payroll_status = if e.on_the_job? and e.payroll_job_id
        :bill_to_job
      else
        :overhead
      end
      e.payroll_pay_rate = if e.ticket.job
        e.ticket.pay_rate
      else
        :day_pay
      end
      
      e.payroll_category_string = "#{e.employee_id} - #{e.payroll_bill_to} - #{e.payroll_job_id} - #{e.payroll_pay_rate} - #{e.payroll_status}"
      
      e.save!
    end
  end
  
end
