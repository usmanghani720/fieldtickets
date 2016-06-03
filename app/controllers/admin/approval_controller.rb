class Admin::ApprovalController < Admin::BaseController
  before_action :set_ticket, only: [:show]
  decorates_assigned :ticket
  
  def index
    @tickets_pending_approval = Ticket::Ticket.approved.pending_admin_approval.decorate
    @tickets_approved = Ticket::Ticket.admin_approved.decorate
    @tickets_disapproved = Ticket::Ticket.admin_disapproved.decorate
  end
  
  def show
    
  end
  
  private
    
    # Look up @ticket from params
    def set_ticket
      @ticket = Ticket::Ticket.find(params[:ticket_id] || params[:id])
    end
end
