class Ticket::EmployeeEntry < ActiveRecord::Base
  include CreatedBy
  include TimesheetEntry
  
  belongs_to :employee
  validates :employee, presence: true
  
  enum status: { idle: 0, transport: 1, maintenance: 2, on_the_job: 3 }
    
  acts_as_paranoid
  
  def to_s
    employee.to_s
  end
  
end