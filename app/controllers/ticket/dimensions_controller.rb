class Ticket::DimensionsController < Ticket::BaseController
  before_action :set_ticket, only: [ :dimensions ]
end
