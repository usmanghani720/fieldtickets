require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  def vehicle
    @vehicle ||= Vehicle.new
  end
  
  def test_blank_name
    assert vehicle.to_s == 'Unnumbered Vehicle'
  end
  
  def test_internal_number
    vehicle.internal_number = '42'
    assert vehicle.to_s == '42'
  end
  
  def test_name_and_number
    vehicle.description = 'F-150'
    vehicle.internal_number = '42'
    assert vehicle.to_s == '42 — F-150'
  end
  
  def test_name
    vehicle.description = 'F-150'
    assert vehicle.to_s == 'Unnumbered Vehicle — F-150'
  end
end
