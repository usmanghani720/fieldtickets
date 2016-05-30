class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :internal_number
      t.string :description
      t.integer :vehicle_type
      
      t.string :display_name # cached display name
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
  end
end
