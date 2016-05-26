require "test_helper"

class Ticket::VehicleTest < ActiveSupport::TestCase
  def vehicle
    @vehicle ||= Ticket::Vehicle.new
  end

  def test_valid
    assert vehicle.valid?
  end
end
