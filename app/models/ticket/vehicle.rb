class Ticket::Vehicle < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  def to_s
    vehicle.to_s
  end
end
