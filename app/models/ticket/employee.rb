class Ticket::Employee < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :employee, class_name: '::Employee'
  
  def to_s
    employee.display_name
  end
end