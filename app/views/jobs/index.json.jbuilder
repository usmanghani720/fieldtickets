json.array!(@jobs) do |job|
  json.extract! job, :id, :internal_number, :customers_number, :flat_rate, :customer_id
  json.url job_url(job, format: :json)
end
