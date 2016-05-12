class EmployeeEntry < ActiveRecord::Base
  belongs_to :field_ticket
  belongs_to :employee
  
  STATUS_TYPES = ['on_the_job', 'overhead', 'idle']
  
  def to_s
    employee.name
  end
end
