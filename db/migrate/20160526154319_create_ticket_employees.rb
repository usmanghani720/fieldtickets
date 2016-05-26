class CreateTicketEmployees < ActiveRecord::Migration
  def change
    create_table :ticket_employees do |t|
      t.references :ticket, index: true
      t.references :employee, index: true

      t.timestamps null: false
    end
  end
end
