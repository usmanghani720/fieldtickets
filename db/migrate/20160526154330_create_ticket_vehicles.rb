class CreateTicketVehicles < ActiveRecord::Migration
  def change
    create_table :ticket_vehicles do |t|
      t.references :ticket, index: true, null: false
      t.references :vehicle, index: true, null: false
      t.integer :ownership, default: 0, null: false
      t.string :rental_description
      
      t.integer :status, default: 0, null: false
      
      t.string :display_name
      
      t.datetime :time

      t.authorstamps :integer, null: true
      t.timestamps null: false
    end
  end
end
