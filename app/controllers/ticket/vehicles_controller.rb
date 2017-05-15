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
      Ticket::VehicleMailer.ticket_vehicle_email(@ticket_vehicle).deliver_now if check_if_any_issue_with_vehicle(@ticket_vehicle) == true
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
         :driver,
         :crew_chief,
         :mirror_broken_explanation, 
         :mirror_working_explanation, 
         :mirror_placed_explanation, 
         :tires_properly_inflated_explanation, 
         :tires_tread_explanation, 
         :windows_broken_explanation, 
         :windows_missing_explanation, 
         :doors_broken_explanation, 
         :doors_dented_explanation, 
         :doors_latched_explanation, 
         :brakes_worn_explanation, 
         :brakes_missing_explanation, 
         :brakes_damaged_explanation, 
         :fifth_wheel_locked_explanation, 
         :fifth_wheel_greased_explanation, 
         :fifth_wheel_abnormal_explanation, 
         :hoses_secured_explanation, 
         :hoses_hanging_explanation, 
         :hoses_leaks_explanation, 
         :hoses_wear_explanation, 
         :flags_secured_explanation, 
         :flags_serviceable_explanation, 
         :rear_bumper_loose_explanation, 
         :rear_bumper_missing_explanation, 
         :rear_bumper_damaged_explanation, 
         :license_plate_dirty_explanation, 
         :license_plate_attached_explanation, 
         :license_plate_sticker_explanation, 
         :truck_bed_tire_explanation, 
         :truck_bed_jack_explanation, 
         :truck_bed_wrench_explanation, 
         :truck_bed_debris_explanation, 
         :truck_bed_tools_explanation, 
         :truck_bed_clean_explanation, 
         :brake_lights_working_explanation, 
         :rear_window_broken_explanation, 
         :rear_window_missing_explanation, 
         :rear_window_clean_explanation, 
         :air_bags_leaks_explanation, 
         :headlights_brights_working_explanation, 
         :headlights_low_beams_working_explanation, 
         :turn_signals_working_explanation, 
         :front_bumper_attached_explanation, 
         :windshield_broken_explanation, 
         :windshield_missing_explanation, 
         :windshield_clean_explanation, 
         :wiper_blades_broken_explanation, 
         :wiper_blades_working_explanation, 
         :overall_interior_clean_explanation, 
         :parking_brake_working_explanation, 
         :horn_working_explanation, 
         :seat_belts_working_explanation, 
         :seat_belts_frayed_explanation, 
         :seat_belts_cut_explanation, 
         :seat_belts_torn_explanation, 
         :seat_belts_snagged_explanation, 
         :seat_belts_roping_explanation, 
         :gauges_working_explanation, 
         :rearview_mirror_placed_explanation, 
         :rearview_mirror_working_explanation, 
         :rearview_mirror_clean_explanation, 
         :registration_present_explanation, 
         :registration_current_explanation, 
         :fluids_add_explanation, 
         :deficiences_corrected_explanation, 
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
      )
    end
    
    
    # Read @vehicle from params
    def set_vehicle
      @vehicle = Ticket::Vehicle.find(params[:vehicle_id])
    end


  def check_if_any_issue_with_vehicle(ticket_vehicle_obj)
        return true if 
        ticket_vehicle_obj.mirror_broken == "mirror_broken_yes" ||
        ticket_vehicle_obj.mirror_working == "mirror_working_no" ||
        ticket_vehicle_obj.mirror_placed == "mirror_placed_no" ||
        ticket_vehicle_obj.tires_properly_inflated == "tires_properly_inflated_no" ||
        ticket_vehicle_obj.tires_tread == "tires_tread_no" ||
        ticket_vehicle_obj.windows_broken == "windows_broken_yes" ||
        ticket_vehicle_obj.windows_missing == "windows_missing_yes" ||
        ticket_vehicle_obj.doors_broken == "doors_broken_yes" ||
        ticket_vehicle_obj.doors_dented == "doors_dented_yes" ||
        ticket_vehicle_obj.doors_latched == "doors_latched_no" ||
        ticket_vehicle_obj.brakes_worn == "brakes_worn_yes" ||
        ticket_vehicle_obj.brakes_missing == "brakes_missing_yes" ||
        ticket_vehicle_obj.brakes_damaged == "brakes_damaged_yes" ||
        ticket_vehicle_obj.fifth_wheel_locked == "fifth_wheel_locked_no" ||
        ticket_vehicle_obj.fifth_wheel_greased == "fifth_wheel_greased_no" ||
        ticket_vehicle_obj.fifth_wheel_abnormal == "fifth_wheel_abnormal_yes" ||
        ticket_vehicle_obj.hoses_secured == "hoses_secured_no" ||
        ticket_vehicle_obj.hoses_hanging == "hoses_hanging_yes" ||
        ticket_vehicle_obj.hoses_leaks == "hoses_leaks_yes" ||
        ticket_vehicle_obj.hoses_wear == "hoses_wear_no" ||
        ticket_vehicle_obj.flags_secured == "flags_secured_no" ||
        ticket_vehicle_obj.flags_serviceable == "flags_serviceable_no" ||
        ticket_vehicle_obj.rear_bumper_loose == "rear_bumper_loose_yes" ||
        ticket_vehicle_obj.rear_bumper_missing == "rear_bumper_missing_yes" ||
        ticket_vehicle_obj.rear_bumper_damaged == "rear_bumper_damaged_yes" ||
        ticket_vehicle_obj.license_plate_dirty == "license_plate_dirty_yes" ||
        ticket_vehicle_obj.license_plate_attached == "license_plate_attached_no" ||
        ticket_vehicle_obj.license_plate_sticker == "license_plate_sticker_yes" ||
        ticket_vehicle_obj.truck_bed_tire == "truck_bed_tire_damaged" ||
        ticket_vehicle_obj.truck_bed_tire == "truck_bed_tire_missing" ||
        ticket_vehicle_obj.truck_bed_jack  == "truck_bed_jack_damaged" ||
        ticket_vehicle_obj.truck_bed_jack  == "truck_bed_jack_missing" ||
        ticket_vehicle_obj.truck_bed_wrench  == "truck_bed_wrench_damaged" ||
        ticket_vehicle_obj.truck_bed_wrench  == "truck_bed_wrench_missing" ||
        ticket_vehicle_obj.truck_bed_debris == "truck_bed_debris_yes" ||
        ticket_vehicle_obj.truck_bed_tools == "truck_bed_tools_yes" ||
        ticket_vehicle_obj.truck_bed_clean == "truck_bed_clean_no" ||
        ticket_vehicle_obj.brake_lights_working == "brake_lights_working_no" ||
        ticket_vehicle_obj.rear_window_broken == "rear_window_broken_yes" ||
        ticket_vehicle_obj.rear_window_missing == "rear_window_missing_yes" ||
        ticket_vehicle_obj.rear_window_clean == "rear_window_clean_no" ||
        ticket_vehicle_obj.air_bags_leaks == "air_bags_leaks_yes" ||
        ticket_vehicle_obj.headlights_brights_working == "headlights_brights_working_no" ||
        ticket_vehicle_obj.headlights_low_beams_working == "headlights_low_beams_working_no" ||
        ticket_vehicle_obj.turn_signals_working == "turn_signals_working_no" ||
        ticket_vehicle_obj.front_bumper_attached == "front_bumper_attached_no" ||
        ticket_vehicle_obj.windshield_broken == "windshield_broken_yes" ||
        ticket_vehicle_obj.windshield_missing == "windshield_missing_yes" ||
        ticket_vehicle_obj.windshield_clean == "windshield_clean_no" ||
        ticket_vehicle_obj.wiper_blades_broken == "wiper_blades_broken_yes" ||
        ticket_vehicle_obj.wiper_blades_working == "wiper_blades_working_no" ||
        ticket_vehicle_obj.overall_interior_clean == "overall_interior_clean_no" ||
        ticket_vehicle_obj.parking_brake_working == "parking_brake_working_no" ||
        ticket_vehicle_obj.horn_working == "horn_working_no" ||
        ticket_vehicle_obj.seat_belts_working == "seat_belts_working_no" ||
        ticket_vehicle_obj.seat_belts_frayed == "seat_belts_frayed_yes" ||
        ticket_vehicle_obj.seat_belts_cut == "seat_belts_cut_yes" ||
        ticket_vehicle_obj.seat_belts_torn == "seat_belts_torn_yes" ||
        ticket_vehicle_obj.seat_belts_snagged == "seat_belts_snagged_yes" ||
        ticket_vehicle_obj.seat_belts_roping == "seat_belts_roping_yes" ||
        ticket_vehicle_obj.gauges_working == "gauges_working_no" ||
        ticket_vehicle_obj.rearview_mirror_placed == "rearview_mirror_placed_no" ||
        ticket_vehicle_obj.rearview_mirror_working == "rearview_mirror_working_no" ||
        ticket_vehicle_obj.rearview_mirror_clean == "rearview_mirror_clean_no" ||
        ticket_vehicle_obj.registration_present == "registration_present_no" ||
        ticket_vehicle_obj.registration_current == "registration_current_no" ||
        ticket_vehicle_obj.fluids_add == "fluids_add_yes" ||
        ticket_vehicle_obj.deficiences_corrected == "deficiences_corrected_yes" ||
        ticket_vehicle_obj.permits_paperwork_present.present? && ticket_vehicle_obj.permits_paperwork_present == "permits_paperwork_present_no" ||
        ticket_vehicle_obj.permits_paperwork_current.present? && ticket_vehicle_obj.permits_paperwork_current == "permits_paperwork_current_no" ||
        ticket_vehicle_obj.chains_binders_present.present? && ticket_vehicle_obj.chains_binders_present == "chains_binders_present_no" ||
        ticket_vehicle_obj.chains_binders_serviceable.present? && ticket_vehicle_obj.chains_binders_serviceable == "chains_binders_serviceable_no"
  end

end
