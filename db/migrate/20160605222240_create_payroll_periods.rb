class CreatePayrollPeriods < ActiveRecord::Migration
  def change
    create_table :payroll_periods do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
