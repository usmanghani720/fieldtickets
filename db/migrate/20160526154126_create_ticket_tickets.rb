class CreateTicketTickets < ActiveRecord::Migration
  def change
    create_table :ticket_tickets do |t|
      t.integer :bill_to, default: 0
      
      t.belongs_to :job, index: true, foreign_key: true
      t.string :job_name_override
            
      t.integer :approval, default: 0
        # { pending_approval: 0, approved: 1, disapproved: 2 }
      t.string :approval_name_and_title
      t.string :approval_email
      t.text :approval_feedback
      
      t.integer :supplies_teeth
      t.decimal :supplies_oil
      t.integer :supplies_holders
      t.text :supplies_notes
      
      t.integer :milling_length
      t.integer :milling_width
      t.decimal :milling_depth
      
      t.decimal :delays_trucks
      t.decimal :delays_paving
      t.decimal :delays_mot
      t.decimal :delays_other
      t.text :delays_notes
      
      t.datetime :finalized_at, index: true
      t.datetime :deleted_at, index: true

      t.authorstamps(:integer)
      t.timestamps null: false
    end
    
    add_attachment :ticket_tickets, :approval_signature
  end
end
