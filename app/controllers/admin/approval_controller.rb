class Admin::ApprovalController < Admin::BaseController
  before_action :set_ticket, only: [:show, :approve]
  decorates_assigned :ticket
  
  def index
    @tickets_pending_approval = Ticket::Ticket.finalized.pending_admin_approval.decorate
    @tickets_approved = Ticket::Ticket.admin_approved.decorate
  end
  
  def index_approved
    index
  end
  
  def show
    
  end
  
  def approve
    @ticket.admin_approved!
    redirect_to admin_approval_index_path
  end
  
  private
    
    # Look up @ticket from params
    def set_ticket
      @ticket = Ticket::Ticket.find(params[:ticket_id] || params[:approval_id] || params[:id])
    end
end
