class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.name :text
      t.internal_number :text

      t.timestamps null: false
    end
  end
end
