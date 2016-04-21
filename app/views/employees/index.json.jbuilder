json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :internal_number
  json.url employee_url(employee, format: :json)
end
