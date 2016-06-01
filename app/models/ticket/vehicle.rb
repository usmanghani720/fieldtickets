class Ticket::Vehicle < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  include TimesheetParent

  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  validates :vehicle, presence: true, unless: :rental?
  validates :vehicle, uniqueness: { scope: :ticket }, unless: :rental?
  
  validates :rental_description, presence: true, if: :rental?
  validates :rental_description, uniqueness: { scope: :ticket }, if: :rental?
  
  enum ownership: { company: 0, rental: 1, employee: 2 }
  enum status: { idle: 0, maintenance: 2, on_the_job: 3 }
  
  scope :mills, -> {
    joins(:vehicle).
    where("vehicles.vehicle_type = ?", 2) # 2 is :mill, per app/models/vehicle.rb
  }
  
  def status=(new_status)
    vehicle_entry = Ticket::VehicleEntry.create!(
      vehicle: self,
      status: new_status
    )
  end
  
  def to_s
    vehicle.to_s
  end
  
end
