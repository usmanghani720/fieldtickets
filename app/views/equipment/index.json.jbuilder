json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :internal_number, :license_plate_number, :vin, :vehicle_type
  json.url equipment_url(equipment, format: :json)
end
