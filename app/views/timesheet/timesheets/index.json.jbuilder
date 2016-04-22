json.array!(@timesheets) do |timesheet|
  json.extract! timesheet, :id, :field_ticket_id, :site_supervisor_id, :crew_chief_id, :finalized, :project, :supplies_teeth, :supplies_oil, :supplies_holders, :supplies_other, :left_job_at
  json.url timesheet_url(timesheet, format: :json)
end
