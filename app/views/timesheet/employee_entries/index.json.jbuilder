json.array!(@timesheet_employee_entries) do |timesheet_employee_entry|
  json.extract! timesheet_employee_entry, :id, :timesheet_id, :employee_id, :start_at, :end_at, :minutes_worked, :boolean
  json.url timesheet_employee_entry_url(timesheet_employee_entry, format: :json)
end
