class Ticket::FinalizeController < Ticket::BaseController

  # TODO: Show a different page if ticket isn't complete.
  def index
    
  end
  
  def update
    if @ticket.finalize!
      flash[:notice] = "You’ve finalized ticket ##{@ticket.number}."
      redirect_to tickets_path
    else
      flash[:error] = "Ticket ##{@ticket.number} could not be finalized."
      redirect_to ticket_finalize_path
    end
  end
  
end
