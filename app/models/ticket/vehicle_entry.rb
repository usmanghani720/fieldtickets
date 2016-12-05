class Ticket::VehicleEntry < ActiveRecord::Base
  include CreatedBy
  include TimesheetEntry
  
  belongs_to :vehicle
  validates :mileage, presence: true, if: :mileage_required?
  validates :fuel_gallons, presence: true, if: :fuel_gallons_required?
  has_one :ticket, through: :vehicle
  
  acts_as_paranoid
  
  enum status: { idle: 0, refuel: 99, maintenance: 2, on_the_job: 3 }
    
  def to_s
    vehicle.to_s
  end
  
  # Shows 
  def available_statuses
    if refuel?
      { 'refuel' => 99 }
    else
      e = nil
      e = :maintenance unless vehicle.maintenance_available?
      Ticket::VehicleEntry.statuses.except :refuel, e
    end
  end
    
  private
  
    def fuel_gallons_required?
      refuel?
    end
  
    def mileage_required?
      refuel?
      #(field_ticket.vehicle_entries.where(vehicle: self.vehicle).count == 0) or
    end
    
end
