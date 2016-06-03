class Ticket::Vehicle < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  include TimesheetParent

  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  validates :vehicle, presence: true, if: :company?
  validates :vehicle, uniqueness: { scope: :ticket }, if: :company?

  validates :mileage, presence: true
  
  validates :manual_description, presence: true, unless: :company?
  validates :manual_description, uniqueness: { scope: :ticket }, unless: :company?
  
  enum ownership: { company: 0, employee: 1, rental: 2 }
  enum status: { idle: 0, maintenance: 2, on_the_job: 3 }
  
  scope :mills, -> {
    joins(:vehicle).
    where("vehicles.vehicle_type = ?", 2) # 2 is :mill, per app/models/vehicle.rb
  }
  
  def maintenance_available?
    if vehicle
      vehicle.mill?
    else
      rental?
    end
  end
  
  def status=(new_status)
    vehicle_entry = Ticket::VehicleEntry.create!(
      vehicle: self,
      status: new_status
    )
  end
  
  def to_s
    if company?
      vehicle.to_s
    else
      manual_description
    end
  end
  
end
