class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :internal_number

      t.timestamps null: false
    end
  end
end
