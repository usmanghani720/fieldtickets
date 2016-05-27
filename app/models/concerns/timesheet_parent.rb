require 'fx_datetime'

module TimesheetParent
  extend ActiveSupport::Concern
  
  included do
    validates :status, presence: true
  end
  
  def recalculate!
    entries.each_with_index do |entry, index|
      next_entry = entries[index + 1]
      
      if next_entry
        entry.time_end = next_entry.time
      else
        entry.time_end = nil
        
        # On the last entry, update the parent with the most recent data.
        self.time = entry.time
        self[:status] = entry.class.statuses[entry.status]
        
        self.save! if self.changed?
      end
        
      if entry.changed?
        # This must be set to true to avoid an infinite callback loop
        entry.recalculating = true
        entry.save!
      end
    end
    
  end
  
  def entries
    method = timesheet_entry_model.pluralize
    send(method)
  end
  
  private
  
    def timesheet_entry
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