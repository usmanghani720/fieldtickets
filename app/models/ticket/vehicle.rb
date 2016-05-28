class Ticket::Vehicle < ActiveRecord::Base
  include DisplayName
  include TimesheetParent

  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  enum status: { idle: 0, maintenance: 2, on_the_job: 3 }
  
  def status=(new_status)
    vehicle_entry = Ticket::VehicleEntry.create!(
      vehicle: self,
      status: new_status
    )
  end
  
  def to_s
    vehicle
  end
  
end
