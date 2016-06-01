class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :internal_number, null: false
      t.string :description
      t.integer :vehicle_type, null: false
      
      t.string :display_name # cached display name
      
      t.datetime :deleted_at, index: true

      t.authorstamps :integer, null: true
      t.timestamps null: false
    end
  end
end
