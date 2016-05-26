class Ticket::BaseController < ApplicationController
  # https://github.com/drapergem/draper#when-to-decorate-objects
  before_action :set_ticket
  decorates_assigned :ticket

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
        :supplies_notes,
    
        :delays_trucks,
        :delays_paving,
        :delays_mot,
        :delays_other,
        :delays_notes,
      )
    end

end
