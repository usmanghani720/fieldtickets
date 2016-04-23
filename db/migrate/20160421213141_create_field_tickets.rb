class CreateFieldTickets < ActiveRecord::Migration
  def change
    create_table :field_tickets do |t|
      t.belongs_to :job, index: true, foreign_key: true
      t.string :bill_to, default: 'Job'
      t.boolean :is_non_job, default: false
      t.datetime :started_at
      t.datetime :finished_at
      t.boolean :customer_approved_work
      t.text :customer_name_and_title
      
      t.text :supplies_teeth
      t.text :supplies_oil
      t.text :supplies_holders
      t.text :supplies_other
      
      t.decimal :length
      t.decimal :width
      t.decimal :depth

      t.timestamps null: false
    end
    
    add_attachment :field_tickets, :customer_signature
  end
end
