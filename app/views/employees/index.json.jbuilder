json.array!(@employees) do |employee|
  json.extract! employee, :id, :text, :text
  json.url employee_url(employee, format: :json)
end
