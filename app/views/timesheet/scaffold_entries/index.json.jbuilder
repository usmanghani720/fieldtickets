json.array!(@timesheet_scaffold_entries) do |timesheet_scaffold_entry|
  json.extract! timesheet_scaffold_entry, :id, :timesheet_id, :equipment_id, :fuel_gallons, :mileage_start, :mileage_end
  json.url timesheet_scaffold_entry_url(timesheet_scaffold_entry, format: :json)
end
