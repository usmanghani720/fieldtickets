class Ticket::BaseController < ApplicationController

  private
    
    # Look up @ticket from params
    def set_ticket
      @ticket = Ticket.find(params[:ticket_id] || params[:id])
    end

end
