class Ticket::VehiclesController < Ticket::BaseController
  before_action :set_vehicle, only: [:create_status, :show]
  
  # Show the Vehicles on this Ticket
  def index
  end
  
  # Show the form to add an Vehicle to this Ticket
  def new
    blank_ticket_vehicle
  end
  
  # Add an Vehicle to this Ticket
  def create
    blank_ticket_vehicle
    @ticket_vehicle.update(ticket_vehicle_params)
    
    if @ticket_vehicle.save
      redirect_to ticket_vehicles_path(@ticket)
    else
      render :new
    end
  end
  
  # Add a new VehicleEntry to change an Vehicle's status
  def create_status
    @vehicle.status = params[:status]
    
    flash[:notice] = "#{@vehicle} marked ‘#{params[:status].titleize}’"
    redirect_to ticket_vehicles_path(@ticket)
  end
  
  # Show the timeclock log
  def show
    @entries = @vehicle.entries.decorate
    @entries_deleted = @vehicle.entries.only_deleted
    @new_entry = Ticket::VehicleEntry.new
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
