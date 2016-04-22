class CreateTimesheetEquipmentEntries < ActiveRecord::Migration
  def change
    create_table :timesheet_equipment_entries do |t|
      t.belongs_to :timesheet_timesheet, index: true, foreign_key: true
      t.belongs_to :equipment, index: true, foreign_key: true
      t.decimal :fuel_gallons
      t.decimal :mileage_start
      t.decimal :mileage_end

      t.timestamps null: false
    end
  end
end
