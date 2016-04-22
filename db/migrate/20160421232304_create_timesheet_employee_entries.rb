class CreateTimesheetEmployeeEntries < ActiveRecord::Migration
  def change
    create_table :timesheet_employee_entries do |t|
      t.belongs_to :timesheet_timesheet, index: true, foreign_key: true
      t.belongs_to :employee, index: true, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.integer :minutes_worked
      t.boolean :per_diem

      t.timestamps null: false
    end
  end
end
