class Ticket::TicketsController < Ticket::BaseController
  before_action :set_ticket, only: [ :show, :update ]
  
  autocomplete :job, :display_name, limit: 50, full: true, scopes: [:in_progress]
  
  autocomplete :equipment, :display_name, limit: 50, full: true

  autocomplete :employee, :display_name, limit: 50, full: true
  
  # Show list of tickets
  # TODO: Functionality not mapped out with permissions yet.
  def index
    @tickets = Ticket.all
  end
  
  # When calling #new, create the Ticket and redirect to it.
  def new
    @ticket = Ticket.create
    redirect_to @ticket
  end
  
  # To show the ticket, redirect to job if Job not set. Otherwise, redirect to employees.
  def show
    if @ticket.bill_to_blank?
      redirect_to ticket_job_path(@ticket)
    else
      redirect_to ticket_employees_path(@ticket)
    end
  end
  
  # Generic updating method, works with all Ticket pages
  def update
    if @ticket.update(ticket_params)
      redirect_to :back, notice: 'Your changes have been saved.'
    else
      render_previous
    end
  end
  
  private
  
    def ticket_params
      params.require(:ticket).permit(
        :bill_to,
        :job_id,
      
        :approval,
        :approval_name_and_title,
        :approval_email,
        :approval_signature,
        :approval_feedback,
      
        :milling_length,
        :milling_width,
        :milling_depth,
      
        :supplies_teeth,
        :supplies_oil,
        :supplies_holders,
        :supplies_other,
      
        :delays_trucks,
        :delays_paving,
        :delays_mot,
        :delays_other,
      )
    end
end
