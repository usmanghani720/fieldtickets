class EquipmentEntry < ActiveRecord::Base
  include Timesheet
  
  belongs_to :field_ticket
  belongs_to :equipment
  
  validates :field_ticket, presence: true
  validates :equipment, presence: true, if: "not rental?"
  validates :rental_description, presence: true, if: "rental?"
  validates :mileage, presence: true, if: :needs_mileage?
  
  before_create :set_default_time
  
  acts_as_paranoid
  
  default_scope { order(:time, :id) }
  
  
  STATUS_TYPES = ['on_the_job', 'in_maintenance', 'refuel', 'idle']
  
  def to_s
    if self.rental?
      "#{rental_description}"
    else
      "#{equipment}"
    end
  end
    
  private
  
    def needs_mileage?
      status == 'refuel'
      #(field_ticket.equipment_entries.where(equipment: self.equipment).count == 0) or
    end
    
end
