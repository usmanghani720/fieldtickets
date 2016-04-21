class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.text :internal_number
      t.text :license_plate_number
      t.text :vin
      t.text :vehicle_type

      t.timestamps null: false
    end
  end
end
