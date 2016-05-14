class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :internal_number
      t.text :customers_number
      t.boolean :flat_rate,   default: false
      t.boolean :completed,   default: false
      t.belongs_to :customer, index: true, foreign_key: true
      
      t.text :display_name

      t.timestamps null: false
    end
  end
end
