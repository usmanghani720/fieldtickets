class Ticket::ApprovalController < Ticket::BaseController
  before_action :set_ticket, only: [ :index ]
  
  def index
  end
end
