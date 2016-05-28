class Ticket::Vehicle < ActiveRecord::Base
  include TimesheetParent

  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  enum status: { idle: 0, maintenance: 2, on_the_job: 3 }
  
  def to_s
    vehicle.display_name + ' — ' + status
  end
  
  def status=(new_status)
    vehicle_entry = Ticket::VehicleEntry.create!(
      vehicle: self,
      status: new_status
    )
  end
  
end
