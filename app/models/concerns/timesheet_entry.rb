require 'fx_datetime'

module TimesheetEntry
  extend ActiveSupport::Concern
  
  included do
    
    default_scope { order(:time, :created_at, :id) } # created_at must be in here — time is rounded to the minute and you're likely to get identical times if you're doing a lot at once.
    
    before_create :set_default_time
    
    attr_accessor :recalculating
    after_save :recalculate!, unless: :recalculating
    after_destroy :recalculate!
    
    validates :status, presence: true
    
  end
    
  def recalculate!
    parent.recalculate!
  end
  
  def parent
    send(timesheet_model)
  end
  
  def time_entered_manually?
    created_at.round_to_minute != time
  end
  
  def time=(new_time)
    if new_time.is_a? String
      new_time = new_time.to_time_with_chronic
    end
    
    self[:time] = new_time.round_to_minute
    
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
  
    def set_default_time
      self.time ||= self.created_at
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