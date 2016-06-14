class Ticket::VehicleDecorator < Ticket::TimesheetParentDecorator
  delegate_all
  
  def fuel_gallons_total
    if object.fuel_gallons_total > 0
      "#{object.fuel_gallons_total.to_i} gallons"
    end
  end
end
