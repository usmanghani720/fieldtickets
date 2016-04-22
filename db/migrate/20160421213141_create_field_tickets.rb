class CreateFieldTickets < ActiveRecord::Migration
  def change
    create_table :field_tickets do |t|
      t.belongs_to :job, index: true, foreign_key: true
      t.belongs_to :non_job, index: true, foreign_key: true
      t.boolean :is_non_job, default: false
      t.datetime :started_at
      t.datetime :finished_at
      t.boolean :customer_approved_work
      t.text :customer_name_and_title

      t.timestamps null: false
    end
    
    add_attachment :field_tickets, :customer_signature
  end
end
