class CreateEquipmentEntries < ActiveRecord::Migration
  def change
    create_table :equipment_entries do |t|
      t.belongs_to :field_ticket, index: true, foreign_key: true
      t.boolean :rental
      t.belongs_to :equipment, index: true, foreign_key: true
      t.text :rental_description
      t.text :status, default: 'idle'
      t.decimal :fuel_gallons
      t.decimal :mileage
      
      t.datetime :time
      t.datetime :time_end        #          calculated
      # t.integer :duration_day   # minutes, calculated
      # t.integer :duration_night # minutes, calculated
      t.integer :duration_total   # minutes, calculated
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
  end
end
