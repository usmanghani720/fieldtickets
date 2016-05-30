class Ticket::EmployeeDecorator < Draper::Decorator
  delegate_all

  def status
    object.status.titleize
  end

end