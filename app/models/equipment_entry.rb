class EquipmentEntry < ActiveRecord::Base
  include Timesheet
  
  belongs_to :field_ticket
  validates :field_ticket, presence: true
  belongs_to :equipment
  validates :equipment, presence: true, if: "not rental?"
  
  validates :rental_description, presence: true, if: "rental?"
  validates :mileage, presence: true, if: :mileage_required?
  
  acts_as_paranoid
  
  timesheet_column :equipment_id
  STATUS_TYPES = ['on_the_job', 'in_maintenance', 'refuel', 'idle']
  
  def maintenance_available?
    if equipment
      equipment.vehicle_type == 'Mill'
    else
      rental?
    end
  end
  
  def to_s
    if self.rental?
      rental_description
    else
      equipment.to_s
    end
  end
    
  private
  
    def mileage_required?
      status == 'refuel'
      #(field_ticket.equipment_entries.where(equipment: self.equipment).count == 0) or
    end
    
end
