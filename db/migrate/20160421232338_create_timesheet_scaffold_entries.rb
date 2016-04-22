class CreateTimesheetScaffoldEntries < ActiveRecord::Migration
  def change
    create_table :timesheet_scaffold_entries do |t|
      t.belongs_to :timesheet_timesheet, index: true, foreign_key: true
      t.belongs_to :equipment, index: true, foreign_key: true
      t.integer :fuel_gallons
      t.integer :mileage_start
      t.integer :mileage_end

      t.timestamps null: false
    end
  end
end
