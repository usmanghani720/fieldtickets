class EquipmentEntry < ActiveRecord::Base
  belongs_to :field_ticket
  belongs_to :equipment
  
  # validates :mileage, presence: true
  validates :equipment, presence: true, if: "not rental?"
  validates :rental_description, presence: true, if: "rental?"
  
  STATUS_TYPES = ['on_the_job', 'in_maintenance', 'refuel', 'idle']
  
  def to_s
    if self.rental?
      "#{rental_description}"
    else
      "#{equipment}"
    end
  end
end
