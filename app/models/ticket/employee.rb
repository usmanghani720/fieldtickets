class Ticket::Employee < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  include TimesheetParent
  
  belongs_to :ticket
  belongs_to :employee, class_name: '::Employee'
  
  validates :employee, uniqueness: { scope: :ticket }
  
  has_many :employee_entries
  
  enum status: { idle: 0, transport: 1, maintenance: 2, on_the_job: 3 }
  
  def hours
    return @hours if @hours
    
    @hours = {total: 0}

    Ticket::Employee.statuses.each do |status, code|
      @hours[status.to_sym] = 0
    end

    employee_entries.each do |entry|
      status = entry.status.to_sym
      duration = entry.duration || 0
      @hours[status] += duration
      @hours[:total] += duration
    end
    
    @hours
  end
  
  def status=(new_status)
    employee_entry = Ticket::EmployeeEntry.create!(
      employee: self,
      status: new_status
    )
  end
  
  def to_s
    employee.display_name
  end
  
end