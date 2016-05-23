class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :job, index: true, foreign_key: true
      t.text :bill_to, default: 'Job'
      t.datetime :submitted_at
      
      t.boolean :customer_approved_work
      t.text :customer_name_and_title
      t.text :customer_feedback
      
      t.text :supplies_teeth
      t.text :supplies_oil
      t.text :supplies_holders
      t.text :supplies_other
      
      t.integer :length
      t.integer :width
      t.decimal :depth
      
      t.text :delays_trucks
      t.text :delays_paving
      t.text :delays_mot
      t.text :delays_other
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
    
    add_attachment :tickets, :customer_signature
  end
end
