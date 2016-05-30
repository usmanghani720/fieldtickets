class CreateTicketNotes < ActiveRecord::Migration
  def change
    create_table :ticket_notes do |t|
      t.references :ticket, index: true
      t.belongs_to :employee, index: true, foreign_key: true
      t.text :note
      t.integer :note_type, default: 1

      t.timestamps null: false
    end
  end
end
