class CreateNonJobs < ActiveRecord::Migration
  def change
    create_table :non_jobs do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
