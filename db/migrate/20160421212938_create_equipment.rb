class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.text :internal_number
      t.text :description
      t.text :vehicle_type
      
      t.text :display_name

      t.timestamps null: false
    end
  end
end
