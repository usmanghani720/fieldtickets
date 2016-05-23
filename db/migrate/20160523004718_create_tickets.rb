class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :bill_to, default: 0
      
      t.belongs_to :job, index: true, foreign_key: true
            
      t.integer :approval, default: 0
        # { not_yet_approved: 0, approved: 1, disapproved: 2 }
      t.text :approval_name_and_title
      t.text :approval_email
      t.text :approval_feedback
      
      t.text :supplies_teeth
      t.text :supplies_oil
      t.text :supplies_holders
      t.text :supplies_other
      
      t.integer :milling_length
      t.integer :milling_width
      t.decimal :milling_depth
      
      t.text :delays_trucks
      t.text :delays_paving
      t.text :delays_mot
      t.text :delays_other
      
      t.datetime :finalized_at, index: true
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
    
    add_attachment :tickets, :approval_signature
  end
end
