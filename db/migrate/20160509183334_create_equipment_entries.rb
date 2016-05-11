class CreateEquipmentEntries < ActiveRecord::Migration
  def change
    create_table :equipment_entries do |t|
      t.belongs_to :field_ticket, index: true, foreign_key: true
      t.boolean :rental
      t.belongs_to :equipment, index: true, foreign_key: true
      t.text :rental_description
      t.text :status
      t.datetime :time
      t.decimal :fuel_gallons
      t.decimal :mileage

      t.timestamps null: false
    end
  end
end
