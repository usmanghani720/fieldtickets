class Ticket::JobController < Ticket::BaseController
  before_action :set_ticket, only: [ :job ]
end
