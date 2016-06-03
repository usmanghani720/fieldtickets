class Ticket::EmployeeDecorator < Ticket::TimesheetParentDecorator
  delegate_all
  
end