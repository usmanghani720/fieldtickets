class CreateTicketEmployees < ActiveRecord::Migration
  def change
    create_table :ticket_employees do |t|
      t.references :ticket, index: true
      t.references :employee, index: true
      t.integer :status, default: 0
      
      t.string :display_name
      
      t.datetime :time

      t.timestamps null: false
    end
  end
end
