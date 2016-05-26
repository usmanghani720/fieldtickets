class CreateTicketVehicles < ActiveRecord::Migration
  def change
    create_table :ticket_vehicles do |t|
      t.belongs_to :ticket_ticket, index: true, foreign_key: true
      t.belongs_to :vehicle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
