class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      
      t.datetime :deleted_at, index: true

      t.authorstamps :integer, null: true
      t.timestamps null: false
    end
  end
end
