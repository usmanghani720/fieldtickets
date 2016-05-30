class Ticket::VehicleEntry < ActiveRecord::Base
  include TimesheetEntry
  
  belongs_to :vehicle
  validates :vehicle, presence: true, unless: :rental?
  
  validates :rental_description, presence: true, if: :rental?
  validates :mileage, presence: true, if: :mileage_required?
  
  acts_as_paranoid
  
  enum status: { idle: 0, refuel: 1, maintenance: 2, on_the_job: 3 }
  
  def maintenance_available?
    if vehicle
      vehicle.mill?
    else
      rental?
    end
  end
  
  def to_s
    if self.rental?
      rental_description
    else
      vehicle.to_s
    end
  end
    
  private
  
    def mileage_required?
      status == 'refuel'
      #(field_ticket.vehicle_entries.where(vehicle: self.vehicle).count == 0) or
    end
    
end
