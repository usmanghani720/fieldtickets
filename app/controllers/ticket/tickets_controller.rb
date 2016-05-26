class Ticket::TicketsController < Ticket::BaseController
  before_action :set_ticket, only: [ :show ]
  
  autocomplete :job, :display_name, limit: 50, full: true, scopes: [:in_progress]
  
  autocomplete :equipment, :display_name, limit: 50, full: true

  autocomplete :employee, :display_name, limit: 50, full: true
  
  # Show list of tickets
  def index
    @tickets = Ticket::Ticket.all
  end
  
  # When calling #new, create the Ticket and redirect to it.
  def new
    @ticket = Ticket::Ticket.create
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
  
end
