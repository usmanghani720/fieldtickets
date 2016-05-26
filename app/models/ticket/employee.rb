class Ticket::Employee < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :employee, class_name: '::Employee'
  
  has_many :employee_entries
  
  def to_s
    employee.display_name
  end
end