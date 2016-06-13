class Ticket::TicketsController < Ticket::BaseController
  before_action :set_ticket, only: [ :show ]
  
  autocomplete :job, :display_name, limit: 50, full: true, scopes: [:in_progress]
  
  autocomplete :vehicle, :display_name, limit: 50, full: true

  autocomplete :employee, :display_name, limit: 50, full: true
  
  # Show list of tickets
  def index
    users_tickets = if current_employee.manager?
      Ticket::Ticket.all
    elsif current_employee.crew_chief?
      Ticket::Ticket.where(crew_chief: current_employee)
    end
    
    @tickets = users_tickets.not_finalized.decorate
    @tickets_finalized = users_tickets.finalized.decorate
  end
  
  # Show list of finalized tickets
  def index_finalized
    index
  end
  
  # When calling #new, create the Ticket and redirect to it.
  def new
    @ticket = Ticket::Ticket.create
    redirect_to ticket_path(@ticket)
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
