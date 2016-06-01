class CreateTicketVehicleEntries < ActiveRecord::Migration
   def change
     create_table :ticket_vehicle_entries do |t|
       t.belongs_to :vehicle, index: true, null: false
       t.integer :status, null: false
       t.decimal :fuel_gallons
       t.decimal :mileage
       
       t.datetime :time
       t.datetime :time_end        #          calculated
       # t.integer :duration_day   # minutes, calculated
       # t.integer :duration_night # minutes, calculated
       t.integer :duration   # minutes, calculated
       
       t.string :reason_for_edit
       
       t.datetime :deleted_at, index: true
 
       t.authorstamps :integer, null: true
       t.timestamps null: false
     end
   end
end
