class Ticket::Employee < ActiveRecord::Base
  include TimesheetParent
  
  belongs_to :ticket
  belongs_to :employee, class_name: '::Employee'
  
  has_many :employee_entries
  
  enum status: { idle: 0, transport: 1, maintenance: 2, on_the_job: 3 }
  
  def to_s
    employee.display_name + ' — ' + status
  end
  
  def status=(new_status)
    employee_entry = Ticket::EmployeeEntry.create!(
      employee: self,
      status: new_status
    )
  end
  
end