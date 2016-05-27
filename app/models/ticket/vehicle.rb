class Ticket::Vehicle < ActiveRecord::Base
  include TimesheetParent

  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  def to_s
    vehicle.display_name + ' — ' + status
  end
end
