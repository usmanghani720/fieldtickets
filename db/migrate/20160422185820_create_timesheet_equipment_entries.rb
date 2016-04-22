class CreateTimesheetEquipmentEntries < ActiveRecord::Migration
  def change
    create_table :timesheet_equipment_entries do |t|
      t.belongs_to :timesheet, index: true, foreign_key: true
      t.belongs_to :equipment, index: true, foreign_key: true
      t.numeric :fuel_gallons
      t.numeric :mileage_start
      t.numeric :mileage_end

      t.timestamps null: false
    end
  end
end
