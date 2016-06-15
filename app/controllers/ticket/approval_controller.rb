class Ticket::ApprovalController < Ticket::BaseController
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
    respond_to do |format|
      
      format.html do
        render :results
      end
      
      format.pdf do
        render pdf: "results",
          template: 'ticket/approval/results'
      end
    end
  end
  
  # Customer has submitted form to finalize approval/disapproval
  def update
    @ticket.approved_at = Time.now
    
    if @ticket.update(ticket_params)
      
      # Add customer feedback to Notes
      @ticket.notes.create(
        note_type: :from_customer,
        note: @ticket.approval_feedback
      )
      
      message = if @ticket.approved?
        'Thanks for approving our work.'
      else
        'Thank you for your feedback.'
      end
      
      redirect_to ticket_approval_path, notice: message
    else
      approval_confirm
    end
  end
end
