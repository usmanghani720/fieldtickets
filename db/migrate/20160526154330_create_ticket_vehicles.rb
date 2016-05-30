class CreateTicketVehicles < ActiveRecord::Migration
  def change
    create_table :ticket_vehicles do |t|
      t.references :ticket, index: true
      t.references :vehicle, index: true
      t.boolean :rental
      t.string :rental_description
      
      t.integer :status, default: 0
      
      t.string :display_name
      
      t.datetime :time

      t.timestamps null: false
    end
  end
end
