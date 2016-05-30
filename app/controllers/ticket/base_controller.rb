class Ticket::BaseController < ApplicationController
  # https://github.com/drapergem/draper#when-to-decorate-objects
  before_action :set_ticket
  decorates_assigned :ticket

  # Generic updating method, works with all Ticket pages
  def update
    set_ticket
    
    if @ticket.update(ticket_params)
      # If there's no Job on the Ticket, but there is a job name entered, save it.
      if params[:ticket_ticket]
        if job_name = params[:ticket_ticket][:job]
          @ticket.update(job_name: job_name)
        end
      end


      redirect_to :back, notice: 'Your changes have been saved.'
    else
      render_previous
    end
  end

  private
    
    # Look up @ticket from params
    def set_ticket
      @ticket = Ticket::Ticket.find(params[:ticket_id] || params[:id])
    end
  
    def ticket_params
      params.require(:ticket_ticket).permit(
        :bill_to,
        :job_id,
    
        :approval,
        :approval_name_and_title,
        :approval_email,
        :approval_feedback,
        :approval_signature,
    
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
