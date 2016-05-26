class CreateTicketEmployees < ActiveRecord::Migration
  def change
    create_table :ticket_employees do |t|
      t.belongs_to :ticket_ticket, index: true, foreign_key: true
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
