class Ticket::BaseController < ApplicationController

  # Generic updating method, works with all Ticket pages
  def update
    set_ticket
    
    if @ticket.update(ticket_params)
      redirect_to :back, notice: 'Your changes have been saved.'
    else
      render_previous
    end
  end

  private
    
    # Look up @ticket from params
    def set_ticket
      @ticket = Ticket.find(params[:ticket_id] || params[:id])
    end

end
