json.array!(@non_jobs) do |non_job|
  json.extract! non_job, :id, :name
  json.url non_job_url(non_job, format: :json)
end
