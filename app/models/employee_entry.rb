class EmployeeEntry < ActiveRecord::Base
  include Timesheet
  
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
  
end
