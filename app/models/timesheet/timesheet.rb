class Timesheet::Timesheet < ActiveRecord::Base
  belongs_to :field_ticket
  belongs_to :site_supervisor
  belongs_to :crew_chief
end
