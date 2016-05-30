class CreateTicketVehicleEntries < ActiveRecord::Migration
   def change
     create_table :ticket_vehicle_entries do |t|
       t.belongs_to :ticket, index: true
       t.belongs_to :vehicle, index: true
       t.integer :status
       t.decimal :fuel_gallons
       t.decimal :mileage
       
       t.datetime :time
       t.datetime :time_end        #          calculated
       # t.integer :duration_day   # minutes, calculated
       # t.integer :duration_night # minutes, calculated
       t.integer :duration   # minutes, calculated
       
       t.datetime :deleted_at, index: true
 
       t.timestamps null: false
     end
   end
end
