class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :internal_number
      t.string :description
      t.string :vehicle_type
      
      t.string :display_name # cached display name
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
  end
end
