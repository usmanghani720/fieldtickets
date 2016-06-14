require 'fx_datetime'

module TimesheetParent
  extend ActiveSupport::Concern
  
  included do
    validates :status, presence: true
    
    # Order so that the most interesting statuses are first, followed by newest changed
    default_scope { order(status: :desc, time: :desc, updated_at: :desc, id:  :desc) }
    
    before_create :set_default_time
  end
  
  def hours
    return @hours if @hours
    
    @hours = {total: 0}

    self.class.statuses.each do |status, code|
      @hours[status.to_sym] = 0
    end

    entries.each do |entry|
      status = entry.status.to_sym
      duration = entry.duration || 0
      @hours[status] += duration
      @hours[:total] += duration
    end
    
    @hours
  end
  
  def recalculate!
    timed_entries = entries.without_refuel.reload
    
    timed_entries.without_refuel.reload.each_with_index do |entry, index|
      next_entry = timed_entries[index + 1]
      
      if next_entry
        entry.time_end = next_entry.time
      else
        entry.time_end = nil
        
        # On the last entry, update the parent with the most recent data.
        # This doesn't work if refuel, because the parent can't be refuel
        self.time = entry.time
        self[:status] = entry.class.statuses[entry.status]
       
        if self.changed?
          raise self.errors.inspect if not self.save
        end
      end
        
      if entry.changed?
        # This must be set to true to avoid an infinite callback loop
        entry.recalculating = true
        
        raise entry.errors.inspect if not entry.save
        # Debug code is useful because this breaks!
      end
    end
    
    # no entries found, reset to default
    if timed_entries.blank?
      self.time = self.created_at
      self[:status] = 0
      
      self.save! if self.changed?
    end
    
  end
  
  def entries
    method = timesheet_entry_model.pluralize
    send(method)
  end
  
  private
  
    def set_default_time
      self.time ||= self.created_at
    end
  
    # For Ticket::Employee, returns "employee"
    def timesheet_model
      self.class.name.split('::').last.underscore
    end
    
    # For Ticket::Employee, returns "employee_entry"
    def timesheet_entry_model
      timesheet_model + '_entry'
    end
end