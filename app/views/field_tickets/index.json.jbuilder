json.array!(@field_tickets) do |field_ticket|
  json.extract! field_ticket, :id, :job_id, :bill_to, :started_at, :finished_at, :customer_approved_work, :customer_name_and_title
  json.url field_ticket_url(field_ticket, format: :json)
end
