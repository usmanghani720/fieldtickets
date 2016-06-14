class Ticket::FinalizeController < Ticket::BaseController

  # TODO: Show a different page if ticket isn't complete.
  def index
    
  end
  
  def update
    @ticket.finalize!
    flash[:notice] = "You’ve finalized ticket ##{@ticket.number}."
    redirect_to tickets_path
  end
  
end
