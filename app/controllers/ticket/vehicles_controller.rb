class Ticket::VehiclesController < Ticket::BaseController
  before_action :set_vehicle, only: [:create_status, :show]
  
  # Show the Vehicles on this Ticket
  def index
  end
  
  # Show the form to add an Vehicle to this Ticket
  def new
    blank_ticket_vehicle
  end
  
  private
    
    # Provides a new @ticket_vehicle attached to this ticket
    def blank_ticket_vehicle
      @ticket_vehicle = Ticket::Vehicle.new(ticket: @ticket)
    end
    
    # The only field we need to make a new ticket_vehicle is vehicle_id
    def ticket_vehicle_params
      params.require(:ticket_vehicle).permit(
        :vehicle_id,
      )
    end
    
    # Read @vehicle from params
    def set_vehicle
      @vehicle = Ticket::Vehicle.find(params[:vehicle_id])
    end

end
