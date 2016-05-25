class Ticket::SuppliesController < Ticket::BaseController
  before_action :set_ticket, only: [ :index ]
end
