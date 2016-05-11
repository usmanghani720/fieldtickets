class EmployeeEntry < ActiveRecord::Base
  belongs_to :employee
  belongs_to :field_ticket
end
