class CreateTicketVehicles < ActiveRecord::Migration
  def change
    create_table :ticket_vehicles do |t|
      t.references :ticket, index: true
      t.references :vehicle, index: true

      t.timestamps null: false
    end
  end
end
