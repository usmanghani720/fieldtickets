class EmployeeEntry < ActiveRecord::Base
  include Timesheet
  
  belongs_to :field_ticket
  validates :field_ticket, presence: true
  belongs_to :employee
  validates :employee, presence: true
  
  timesheet_column :employee_id
  STATUS_TYPES = ['on_the_job', 'overhead', 'idle']
    
  acts_as_paranoid
  
  def to_s
    employee.to_s
  end
  
end
