class Ticket::VehiclesController < Ticket::BaseController
  before_action :set_vehicle, only: [:show, :create_status, :edit_status, :update_status, :delete_status, :new_refuel, :create_refuel]
  
  
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
    @ticket_vehicle.assign_attributes(ticket_vehicle_params)
    
    if not @ticket_vehicle.vehicle
      str = params[:ticket_vehicle][:vehicle].searchable
      vehicles = Vehicle.where('name_searchable LIKE ?', "%#{str}%")
      if vehicles.count == 1
        @ticket_vehicle.vehicle = vehicles[0]
      end
    end
    
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
    timezone = if params[:time_zone] == 'eastern'
      ActiveSupport::TimeZone.new('Eastern Time (US & Canada)')
    elsif params[:time_zone] == 'central'
      ActiveSupport::TimeZone.new('Central Time (US & Canada)')
    end
    
    old_timezone = Chronic.time_class
    Chronic.time_class = timezone
    time = Chronic.parse('today at ' + params[:time])
    Chronic.time_class = old_timezone
        
    begin
      @vehicle.update_status(params[:vehicle_status], time)
      flash[:notice] = "#{@vehicle} marked ‘#{@vehicle.status.titleize}’"
    rescue ActiveRecord::RecordNotSaved
      flash[:error] = "This ticket is for #{ticket.first_employee_entry}, so you can no longer update a vehicle’s status. If you need to make changes, click the vehicle and click “View Timesheet…”"
    end
    
    redirect_to ticket_vehicles_path(@ticket)
    
    
    #@vehicle.status = params[:status]
    #
    #flash[:notice] = "#{@vehicle} marked ‘#{params[:status].titleize}’"
  end
  
  # Show the form to edit a status
  def edit_status
    @entries = @vehicle.entries.decorate
    @entries_deleted = @vehicle.entries.only_deleted
    
    @entry_id = params[:vehicle_entry_id].to_i
    render :edit_status
  end
  
  # Post the changes of an edited status
  def update_status
    @vehicle_entry = Ticket::VehicleEntry.find params[:vehicle_entry_id]
    
    if @vehicle_entry.update(ticket_vehicle_entry_params)
      redirect_to ticket_vehicle_log_path(@ticket, @vehicle), notice: 'Your change has been saved.'
    else
      edit_status
    end
  end
  
  # Delete status
  def delete_status
    @vehicle_entry = Ticket::VehicleEntry
    .find params[:vehicle_entry_id]
    
    @vehicle_entry.destroy!
    
    redirect_to ticket_vehicle_log_path(@ticket, @vehicle), notice: 'That timesheet entry has been deleted.'
  end
  
  # Show form to refuel
  def new_refuel
    @vehicle_entry = Ticket::VehicleEntry.new(vehicle: @vehicle)
  end
  
  # Save the refuel entry
  def create_refuel
    @vehicle_entry = Ticket::VehicleEntry.new(
      vehicle: @vehicle,
      status: :refuel
    )
    
    if @vehicle_entry.update(ticket_vehicle_entry_params)
      redirect_to ticket_vehicles_path
    else
      render :new_refuel
    end
    
  end
  
  
  private
    
    # Provides a new @ticket_vehicle attached to this ticket
    def blank_ticket_vehicle
      @ticket_vehicle = Ticket::Vehicle.new(ticket: @ticket)
    end
    
    # The fields we need to make a new ticket_vehicle
    def ticket_vehicle_params
      params.require(:ticket_vehicle).permit(
        :vehicle_id,
        :ownership,
        :manual_description,
        :mileage,
      )
    end
    
    # For editing
    def ticket_vehicle_entry_params
      params.require(:ticket_vehicle_entry).permit(
        :status,
        :time,
        :reason_for_edit,
        :manually_edited,
        :mileage,
        :fuel_gallons,
        :mirror_broken,
        :mirror_working,
         :mirror_placed,
         :tires_inflated,
         :tires_properly_inflated,
         :tires_tread,
         :windows_broken,
         :windows_missing,
         :doors_broken,
         :doors_dented,
         :doors_latched,
         :brakes_worn,
         :brakes_missing,
         :brakes_damaged,
         :fifth_wheel_locked,
         :fifth_wheel_greased,
         :fifth_wheel_abnormal,
         :hoses_secured,
         :hoses_hanging,
         :hoses_leaks,
         :hoses_wear,
         :flags_secured,
         :flags_serviceable,
         :rear_bumper_loose,
         :rear_bumper_missing,
         :rear_bumper_damaged,
         :license_plate_dirty,
         :license_plate_attached,
         :license_plate_sticker,
         :truck_bed_tire,
         :truck_bed_jack,
         :truck_bed_wrench,
         :truck_bed_debris,
         :truck_bed_tools,
         :truck_bed_clean,
         :brake_lights_working,
         :rear_window_broken,
         :rear_window_missing,
         :rear_window_clean,
         :air_bags_leaks,
         :headlights_brights_working,
         :headlights_low_beams_working,
         :turn_signals_working,
         :front_bumper_attached,
         :windshield_broken,
         :windshield_missing,
         :windshield_clean,
         :wiper_blades_broken,
         :wiper_blades_working,
         :overall_interior_clean,
         :parking_brake_working,
         :horn_working,
         :seat_belts_working,
         :seat_belts_frayed,
         :seat_belts_cut,
         :seat_belts_torn,
         :seat_belts_snagged,
         :seat_belts_roping,
         :gauges_working,
         :rearview_mirror_placed,
         :rearview_mirror_working,
         :rearview_mirror_clean,
         :registration_present,
         :registration_current,
         :fluids_add,
         :deficiences_corrected,
         :permits_paperwork_present,
         :permits_paperwork_current,
         :chains_binders_present,
         :chains_binders_serviceable,
      )
    end
    
    
    # Read @vehicle from params
    def set_vehicle
      @vehicle = Ticket::Vehicle.find(params[:vehicle_id])
    end

end
