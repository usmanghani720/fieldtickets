require "test_helper"

class Ticket::VehicleEntryTest < ActiveSupport::TestCase
  def vehicle_entry
    @vehicle_entry ||= Ticket::VehicleEntry.new
  end
  
  def truck
  end
  
  def mill
  end
  
  def rental
  end

  def test_invalid
    refute vehicle_entry.valid?
  end
  
  def test_maintenance_available?
    refute vehicle_entry.maintenance_available?
  end
end
