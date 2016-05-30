class Ticket::VehicleDecorator < Draper::Decorator
  delegate_all
  
  def status
    object.status.titleize
  end

end
