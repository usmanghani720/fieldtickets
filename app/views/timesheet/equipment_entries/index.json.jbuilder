json.array!(@timesheet_equipment_entries) do |timesheet_equipment_entry|
  json.extract! timesheet_equipment_entry, :id, :timesheet_id, :equipment_id, :fuel_gallons, :mileage_start, :mileage_end
  json.url timesheet_equipment_entry_url(timesheet_equipment_entry, format: :json)
end
