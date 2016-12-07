require 'fx_datetime'
require 'pp'

module TimesheetEntry
  extend ActiveSupport::Concern
  
  included do
    
    default_scope { order(:time, :created_at, :id) } # created_at must be in here — time is rounded to the minute and you're likely to get identical times if you're doing a lot at once.
    
    scope :without_refuel, -> { where.not(status: 99) }
    
    before_save :set_default_time
    
    attr_accessor :recalculating
    after_save :recalculate!, unless: :recalculating
    after_destroy :recalculate!
    
    validates :status, presence: true
    validates :reason_for_edit, presence: true, if: :manually_edited?
    
    before_create :cannot_be_outside_ticket_date
    before_update :cannot_be_outside_ticket_date
    
  end
    
  def recalculate!
    parent.recalculate!
  end
  
  def parent
    send(timesheet_model)
  end
  
  def time
    set_default_time
    self[:time]
  end
  
  def time_entered_manually?
    wiggle_room = 15.minutes
    
    t = created_at.round_to_minute
    t_min = t - wiggle_room
    t_max = t + wiggle_room
    
    return (not (time >= t_min and time <= t_max))
  end
  
  def time=(new_time)
    if new_time.is_a? String
      self[:time] = new_time.to_time_with_chronic.round_to_minute
    elsif new_time
      self[:time] = new_time.round_to_minute
    else
      self[:time] = nil
    end
    
    recalculate_duration
  end
  
  def time_end=(new_time_end)
    self[:time_end] = if new_time_end
      new_time_end.round_to_minute
    end
    
    if time
      # Don't let time_end be less than time
      if time_end and (time >= time_end)
        self[:time_end] = time
      end
      
      recalculate_duration
    end
  end
  
  
  private
  
    def cannot_be_outside_ticket_date
      if outside_ticket_date?
        errors.add(
          :time,
          :outside_ticket_date,
          ticket_date: ticket.first_employee_entry
        )
        return false
      end
    end
    
    def outside_ticket_date?
      if ticket.employee_entries.count == 0
        # If there's only one employee entry, it's okay to edit it manually.
        return false
        
      elsif earliest_time = ticket.first_employee_entry
        # latest time is 6 AM the day after first entry
        latest_time = earliest_time + 1.day + 6.hours
        
        #raise self.inspect
        if (time < earliest_time) or (time > latest_time)
          return true
        else
          return false
        end
        
      else
        return false
      end
    end
  
    def set_default_time
      self[:time] ||= self.created_at
    end
    
    # For Ticket::Employee, returns "employee"
    def timesheet_model
      # Take "_entry" off the end
      timesheet_entry_model.gsub /_entry$/, ''
    end
    
    # For Ticket::EmployeeEntry, returns "employee_entry"
    def timesheet_entry_model
      self.class.name.split('::').last.underscore
    end
    
    
    # def recalculate_all
    #   self.class.recalculate(field_ticket_id, @column)
    # end
    
    # Simply subtract times to get duration
    def recalculate_duration
      if time.blank? or time_end.blank? or time == time_end or status == 'idle'
        self[:duration] = nil
      else
        self[:duration] = (time_end - time) / 60
      end
    end
    
end