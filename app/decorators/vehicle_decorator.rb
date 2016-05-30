class VehicleDecorator < Draper::Decorator
  delegate_all
  
  def vehicle_type
    if object.vehicle_type
      object.vehicle_type.titleize
    end
  end

end