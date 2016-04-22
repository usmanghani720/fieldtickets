class Timesheet::EquipmentEntry < ActiveRecord::Base
  belongs_to :timesheet
  belongs_to :equipment
end
