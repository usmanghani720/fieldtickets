class EquipmentEntry < ActiveRecord::Base
  belongs_to :field_ticket
  belongs_to :equipment
end
