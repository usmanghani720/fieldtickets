class CreateTicketNotes < ActiveRecord::Migration
  def change
    create_table :ticket_notes do |t|
      t.references :ticket, index: true, null: false
      t.text :note, null: false
      t.integer :note_type, default: 1, null: false

      t.authorstamps :integer, null: true
      t.timestamps null: false
    end
  end
end
