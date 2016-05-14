module Timesheet
  extend ActiveSupport::Concern
  
  included do
    # created_at must be in here — time is rounded to the minute and you're likely to get identical times if you're doing a lot at once.
    default_scope { order(:time, :created_at) }
    
    before_create :set_default_time
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
end