class Ticket::VehiclesController < Ticket::BaseController
  before_action :set_vehicle, only: [:show, :create_status, :edit_status, :update_status, :delete_status]
  
  
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
  
  # Show the timeclock log
  def show
    @entries = @vehicle.entries.decorate
    @entries_deleted = @vehicle.entries.only_deleted
    @new_entry = Ticket::VehicleEntry.new
  end
  
  # Add a new VehicleEntry to change an Vehicle's status
  def create_status
    @vehicle.status = params[:status]
    
    flash[:notice] = "#{@vehicle} marked ‘#{params[:status].titleize}’"
    redirect_to ticket_vehicles_path(@ticket)
  end
  
  # Show the form to edit a status
  def edit_status
    @entries = @vehicle.entries.decorate
    @entries_deleted = @vehicle.entries.only_deleted
    
    @entry_id = params[:vehicle_entry_id].to_i
  end
  
  # Post the changes of an edited status
  def update_status
    @vehicle_entry = Ticket::VehicleEntry.find params[:vehicle_entry_id]
    
    if @vehicle_entry.update(ticket_vehicle_entry_params)
      redirect_to ticket_vehicle_log_path(@ticket, @vehicle), notice: 'Your change has been saved.'
    else
      render_previous
    end
  end
  
  # Delete status
  def delete_status
    @vehicle_entry = Ticket::VehicleEntry
    .find params[:vehicle_entry_id]
    
    @vehicle_entry.destroy!
    
    redirect_to ticket_vehicle_log_path(@ticket, @vehicle), notice: 'That timesheet entry has been deleted.'
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
    
    # For editing
    def ticket_vehicle_entry_params
      params.require(:ticket_vehicle_entry).permit(
        :status,
        :time,
        :reason_for_edit,
      )
    end
    
    
    # Read @vehicle from params
    def set_vehicle
      @vehicle = Ticket::Vehicle.find(params[:vehicle_id])
    end

end
