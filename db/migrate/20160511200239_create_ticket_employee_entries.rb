class CreateTicketEmployeeEntries < ActiveRecord::Migration
   def change
     create_table :ticket_employee_entries do |t|
       t.belongs_to :employee, index: true, null: false
       t.integer :status, null: false
       
       t.datetime :time
       t.datetime :time_end        #          calculated from next entry
       t.integer :duration         # minutes, calculated
              
       t.string :reason_for_edit
       
       t.datetime :deleted_at, index: true
 
       t.authorstamps :integer, null: true
       t.timestamps null: false
       
       t.belongs_to :payroll_period, index: true
       t.date :payroll_worked_date # equals ticket date
       t.integer :payroll_duration_standard
       t.integer :payroll_duration_overtime
       t.integer :payroll_bill_to
       t.integer :payroll_job_id
       t.integer :payroll_pay_rate
       t.integer :payroll_status
       
       # Payroll reports are summed and uniqued by this field.
       t.string :payroll_category_string
     end
   end
end
