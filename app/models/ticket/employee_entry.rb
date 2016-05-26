class Ticket::EmployeeEntry < ActiveRecord::Base
  include Timesheet
  
  belongs_to :ticket
  validates :ticket, presence: true
  belongs_to :employee
  validates :employee, presence: true
  
  STATUS_TYPES = ['on_the_job', 'overhead', 'idle']
    
  acts_as_paranoid
  
  def to_s
    employee.to_s
  end
  
  private
  
    # Required by Timesheet concern
    def timesheet_column
      :employee_id
    end
  
end
