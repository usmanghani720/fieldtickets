class CreateEmployeeEntries < ActiveRecord::Migration
  def change
    create_table :employee_entries do |t|
      t.belongs_to :employee, index: true, foreign_key: true
      t.belongs_to :field_ticket, index: true, foreign_key: true
      t.text :status, default: 'idle'
      
      t.datetime :time
      t.integer :duration_in_minutes
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
  end
end
