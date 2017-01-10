class Ticket::BaseController < ApplicationController
  # https://github.com/drapergem/draper#when-to-decorate-objects
  before_action :set_ticket
  decorates_assigned :ticket

  # Generic updating method, works with all Ticket pages
  def update
    set_ticket
    @ticket.assign_attributes(ticket_params)
    
    if params[:ticket_ticket] and params[:ticket_ticket][:crew_chief_id].blank? and not params[:ticket_ticket][:crew_chief].blank?
      str = params[:ticket_ticket][:crew_chief].searchable
      employees = Employee.where('name_searchable LIKE ?', "%#{str}%")
      if employees.count == 1
        @ticket.crew_chief = employees[0]
      end
    end
    
    if @ticket.save
      redirect_to :back, notice: 'Your changes have been saved.'
    else
      render_previous
    end
  end

  private
  
    def authorized?
      current_user.manager? or current_user.crew_chief?
    end
    
    # Look up @ticket from params
    def set_ticket
      @ticket = Ticket::Ticket.find(params[:ticket_id] || params[:id])
    end
  
    def ticket_params
      params.require(:ticket_ticket).permit(
        :crew_chief_id,
        
        :bill_to,
        :job_name_entry,
    
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