class Ticket::DelaysController < Ticket::BaseController
  before_action :set_ticket, only: [ :index ]
end
