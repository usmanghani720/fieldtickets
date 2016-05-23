class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      
      t.text :internal_number
      t.text :customers_number
      
      t.integer :billing, default: 0
        # [ day_rate: 1, square_yards: 2, hourly: 3 ]
      t.integer :status, default: 0
        # [ in_progress: 0, completed: 1 ]  
      
      t.text :display_name # cached display name
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
  end
end
