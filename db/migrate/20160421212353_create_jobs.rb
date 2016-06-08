class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :customer, index: true, foreign_key: true, null: false
      
      t.string :internal_number, null: false
      t.string :customer_number
      
      t.integer :billing, null: false
        # [ day_rate: 1, square_yards: 2, hourly: 3 ]
      t.integer :pay_rate, null: false
        # { day_pay: 1, night_pay: 2 }
      
      t.string :display_name # cached display name
      
      t.datetime :completed_at, index: true
      t.datetime :deleted_at, index: true

      t.authorstamps :integer, null: true
      t.timestamps null: false
    end
  end
end
