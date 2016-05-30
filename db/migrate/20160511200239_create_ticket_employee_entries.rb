class CreateTicketEmployeeEntries < ActiveRecord::Migration
   def change
     create_table :ticket_employee_entries do |t|
       t.belongs_to :employee, index: true
       # t.belongs_to :ticket, index: true
       # No longer needed because Ticket::Employee links to Ticket::Ticket
       t.integer :status
       
       t.datetime :time
       t.datetime :time_end        #          calculated
       #t.integer :duration_day     # minutes, calculated
       #t.integer :duration_night   # minutes, calculated
       t.integer :duration   # minutes, calculated
       
       t.datetime :deleted_at, index: true
 
       t.authorstamps(:integer)
      t.timestamps null: false
     end
   end
end
