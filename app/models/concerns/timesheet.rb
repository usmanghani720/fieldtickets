module Timesheet
  extend ActiveSupport::Concern
  
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
end