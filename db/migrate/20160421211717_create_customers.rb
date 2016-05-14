class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.text :name
      
      t.datetime :deleted_at, index: true

      t.timestamps null: false
    end
  end
end
