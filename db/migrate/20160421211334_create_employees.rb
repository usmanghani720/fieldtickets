class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :nickname
      t.text :internal_number

      t.text :display_name # cached display name

      t.timestamps null: false
    end
  end
end
