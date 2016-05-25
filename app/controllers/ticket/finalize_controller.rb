class Ticket::FinalizeController < Ticket::BaseController
  before_action :set_ticket, only: [ :index ]
end
