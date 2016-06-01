class CreateTicketEmployees < ActiveRecord::Migration
  def change
    create_table :ticket_employees do |t|
      t.references :ticket, index: true, null: false
      t.references :employee, index: true, null: false
      t.boolean :per_diem, default: false, null: false
      
      t.integer :status, default: 0, null: false
      
      t.string :display_name
      
      t.datetime :time

      t.authorstamps :integer, null: true
      t.timestamps null: false
    end
  end
end
