class Ticket::VehicleEntry < ActiveRecord::Base
  include CreatedBy
  include TimesheetEntry
  
  belongs_to :vehicle
  validates :mileage, presence: true, if: :mileage_required?
  
  acts_as_paranoid
  
  enum status: { idle: 0, refuel: 1, maintenance: 2, on_the_job: 3 }
    
  def to_s
    vehicle.to_s
  end
  
  # Shows 
  def available_statuses
    if refuel?
      { 'refuel' => 1 }
    else
      e = nil
      e = :maintenance unless vehicle.maintenance_available?
      Ticket::VehicleEntry.statuses.except :refuel, e
    end
  end
    
  private
  
    def mileage_required?
      status == 'refuel'
      #(field_ticket.vehicle_entries.where(vehicle: self.vehicle).count == 0) or
    end
    
end
