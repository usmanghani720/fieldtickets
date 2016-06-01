class CreateTicketEmployeeEntries < ActiveRecord::Migration
   def change
     create_table :ticket_employee_entries do |t|
       t.belongs_to :employee, index: true, null: false
       # t.belongs_to :ticket, index: true
       # No longer needed because Ticket::Employee links to Ticket::Ticket
       t.integer :status, null: false
       
       t.datetime :time
       t.datetime :time_end        #          calculated
       #t.integer :duration_day     # minutes, calculated
       #t.integer :duration_night   # minutes, calculated
       t.integer :duration   # minutes, calculated
       
       t.string :reason_for_edit
       
       t.datetime :deleted_at, index: true
 
       t.authorstamps :integer, null: true
       t.timestamps null: false
     end
   end
end
