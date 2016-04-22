class CreateTimesheetTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.belongs_to :field_ticket, index: true, foreign_key: true
      t.integer :site_supervisor_id, index: true, foreign_key: true
      t.integer :crew_chief_id, index: true, foreign_key: true
      t.boolean :finalized
      t.text :project
      t.text :supplies_teeth
      t.text :supplies_oil
      t.text :supplies_holders
      t.text :supplies_other
      t.datetime :left_job_at

      t.timestamps null: false
    end
  end
end
