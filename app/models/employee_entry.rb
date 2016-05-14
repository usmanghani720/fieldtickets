class EmployeeEntry < ActiveRecord::Base
  belongs_to :field_ticket
  belongs_to :employee
  
  STATUS_TYPES = ['on_the_job', 'overhead', 'idle']
  
  validates :field_ticket, presence: true
  validates :employee, presence: true
  
  before_create :set_default_time
  
  acts_as_paranoid
  
  default_scope { order(:time, :id) }
  
  def to_s
    employee.to_s
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
