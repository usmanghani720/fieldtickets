class Ticket::ApprovalController < Ticket::BaseController
  before_action :set_ticket
  
  # Crew chief has tapped Approval in the sidebar
  def index
    if @ticket.pending_approval?
      # Show customer's representative the approval workflow
      approval
    else
      # Show crew chief details of customer approval
      results
    end
  end
  
  # Page 1 of customer screen
  def approval
    @minimal_ui = true
    render :approval
  end
  
  # Page 2 of customer screen
  # Customer has pressed yes or no, and is presented with signature capture
  def approval_confirm
    @minimal_ui = true
    
    case params[:decision]
    when 'approve'
      render :confirm_approve
    when 'disapprove'
      render :confirm_disapprove
    else
      raise
    end
  end
  
  def results
    render :results
  end
  
  # Customer has submitted form to finalize approval/disapproval
  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_approval_path, notice: 'Your changes have been saved.'
    else
      approval_confirm
    end
  end
end
