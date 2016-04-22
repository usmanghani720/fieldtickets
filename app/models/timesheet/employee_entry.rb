class Timesheet::EmployeeEntry < ActiveRecord::Base
  belongs_to :timesheet
  belongs_to :employee
end
