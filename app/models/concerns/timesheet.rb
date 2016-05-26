require 'fx_datetime'

module Timesheet
  extend ActiveSupport::Concern
  
  included do
    
    default_scope { order(:time, :created_at) } # created_at must be in here — time is rounded to the minute and you're likely to get identical times if you're doing a lot at once.
    
    before_create :set_default_time
    
    after_save :recalculate_all
    
  end
  
  class_methods do
    def recalculate(field_ticket_id, column_data)
      entries = self.where(
        field_ticket_id: field_ticket_id,
        @column => column_data
      )
      
      entries.each_with_index do |entry, index|
        next_entry = entries[index + 1]
        
        if next_entry
          entry.time_end = next_entry.time
        else
          entry.time_end = nil
        end
          
        entry.save if entry.changed?
      end
      
      true
    end
    
  end
  
  # Don't let time_end be less than time
  def time_end=(new_time_end)
    self[:time_end] = new_time_end
    
    if time
      if time_end and (time >= time_end)
        self[:time_end] = time
      end
      
      recalculate_duration
    end
  end
  
  def time_entered_manually?
    created_at.round_to_minute != time
  end
  
  def time=(new_time)
    self[:time] = new_time.round_to_minute
  end
  
  private
  
    def set_default_time
      self.time ||= self.created_at
    end
    
    def recalculate_all
      self.class.recalculate(field_ticket_id, @column)
    end
  
    def recalculate_duration
      if time.blank? or time_end.blank? or time == time_end or status == 'idle'
        self[:duration_day] = nil
        self[:duration_night] = nil
        self[:duration_total] = nil
      else
        
        day_start = (8.0).hours + 1.second # 8:00:01 am
        day_end = (18.0).hours # 6:00 pm
        day_range = day_start..day_end
        
        day_minutes = 0
        night_minutes = 0
        i = time
        while (i += 1.minute) <= time_end do
          if day_range.include? i.seconds_since_midnight
            day_minutes += 1
          else
            night_minutes += 1
          end
        end
        
        self[:duration_day] = day_minutes
        self[:duration_night] = night_minutes
        self[:duration_total] = day_minutes + night_minutes
        
      end
      
    end
    
end