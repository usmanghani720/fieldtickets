class Ticket::Vehicle < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  include TimesheetParent

  after_save :send_mail_about_faulty_vehicle


  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  validates :vehicle, presence: true, if: :company?
  validates :vehicle, uniqueness: { scope: :ticket }, if: :company?

  #validates :mileage, presence: true
  
  #validates :manual_description, presence: true, unless: :company?
  #validates :manual_description, uniqueness: { scope: :ticket }, unless: :company?
  
  enum ownership: { company: 0, employee: 1, rental: 2 }

  enum status: { idle: 0, maintenance: 2, on_the_job: 3 }

  enum mirror_broken: {mirror_broken_yes: 0, mirror_broken_no: 1} 

  enum mirror_working: {mirror_working_yes: 0, mirror_working_no: 1}

  enum mirror_placed: {mirror_placed_yes: 0, mirror_placed_no: 1}

  enum tires_properly_inflated: {tires_properly_inflated_yes: 0, tires_properly_inflated_no: 1}

  enum tires_tread: {tires_tread_yes: 0, tires_tread_no: 1}

  enum windows_broken: {windows_broken_yes: 0, windows_broken_no: 1}

  enum windows_missing: {windows_missing_yes: 0, windows_missing_no: 1}

  enum doors_broken: {doors_broken_yes: 0, doors_broken_no: 1}

  enum doors_dented: {doors_dented_yes: 0, doors_dented_no: 1}

  enum doors_latched: {doors_latched_yes: 0, doors_latched_no: 1}

  enum brakes_worn: {brakes_worn_yes: 0, brakes_worn_no: 1}

  enum brakes_missing: {brakes_missing_yes: 0, brakes_missing_no: 1}

  enum brakes_damaged: {brakes_damaged_yes: 0, brakes_damaged_no: 1}

  enum fifth_wheel_locked: {fifth_wheel_locked_yes: 0, fifth_wheel_locked_no: 1}

  enum fifth_wheel_greased: {fifth_wheel_greased_yes: 0, fifth_wheel_greased_no: 1}

  enum fifth_wheel_abnormal: {fifth_wheel_abnormal_yes: 0, fifth_wheel_abnormal_no: 1}

  enum hoses_secured: {hoses_secured_yes: 0, hoses_secured_no: 1}

  enum hoses_hanging: {hoses_hanging_yes: 0, hoses_hanging_no: 1}

  enum hoses_leaks: {hoses_leaks_yes: 0, hoses_leaks_no: 1}

  enum hoses_wear: {hoses_wear_yes: 0, hoses_wear_no: 1}

  enum flags_secured: {flags_secured_yes: 0, flags_secured_no: 1}

  enum flags_serviceable: {flags_serviceable_yes: 0, flags_serviceable_no: 1}

  enum rear_bumper_loose: {rear_bumper_loose_yes: 0, rear_bumper_loose_no: 1}

  enum rear_bumper_missing: {rear_bumper_missing_yes: 0, rear_bumper_missing_no: 1}

  enum rear_bumper_damaged: {rear_bumper_damaged_yes: 0, rear_bumper_damaged_no: 1}

  enum license_plate_dirty: {license_plate_dirty_yes: 0, license_plate_dirty_no: 1}

  enum license_plate_attached: {license_plate_attached_yes: 0, license_plate_attached_no: 1}

  enum license_plate_sticker: {license_plate_sticker_yes: 0, license_plate_sticker_no: 1}

  enum truck_bed_tire: {truck_bed_tire_present: 0, truck_bed_tire_damaged: 1, truck_bed_tire_missing: 2}

  enum truck_bed_jack: {truck_bed_jack_present: 0, truck_bed_jack_damaged: 1, truck_bed_jack_missing: 2}

  enum truck_bed_wrench: {truck_bed_wrench_present: 0, truck_bed_wrench_damaged: 1, truck_bed_wrench_missing: 2}

  enum truck_bed_debris: {truck_bed_debris_yes: 0, truck_bed_debris_no: 1}

  enum truck_bed_tools: {truck_bed_tools_yes: 0, truck_bed_tools_no: 1}

  enum truck_bed_clean: {truck_bed_clean_yes: 0, truck_bed_clean_no: 1}

  enum brake_lights_working: {brake_lights_working_yes: 0, brake_lights_working_no: 1}

  enum rear_window_broken: {rear_window_broken_yes: 0, rear_window_broken_no: 1}

  enum rear_window_missing: {rear_window_missing_yes: 0, rear_window_missing_no: 1}

  enum rear_window_clean: {rear_window_clean_yes: 0, rear_window_clean_no: 1}

  enum air_bags_leaks: {air_bags_leaks_yes: 0, air_bags_leaks_no: 1}

  enum headlights_brights_working: {headlights_brights_working_yes: 0, headlights_brights_working_no: 1}

  enum headlights_low_beams_working: {headlights_low_beams_working_yes: 0, headlights_low_beams_working_no: 1}

  enum turn_signals_working: {turn_signals_working_yes: 0, turn_signals_working_no: 1}

  enum front_bumper_attached: {front_bumper_attached_yes: 0, front_bumper_attached_no: 1}

  enum windshield_broken: {windshield_broken_yes: 0, windshield_broken_no: 1}

  enum windshield_missing: {windshield_missing_yes: 0, windshield_missing_no: 1}

  enum windshield_clean: {windshield_clean_yes: 0, windshield_clean_no: 1}

  enum wiper_blades_broken: {wiper_blades_broken_yes: 0, wiper_blades_broken_no: 1}

  enum wiper_blades_working: {wiper_blades_working_yes: 0, wiper_blades_working_no: 1}

  enum overall_interior_clean: {overall_interior_clean_yes: 0, overall_interior_clean_no: 1}

  enum parking_brake_working: {parking_brake_working_yes: 0, parking_brake_working_no: 1}

  enum horn_working: {horn_working_yes: 0, horn_working_no: 1}

  enum seat_belts_working: {seat_belts_working_yes: 0, seat_belts_working_no: 1}

  enum seat_belts_frayed: {seat_belts_frayed_yes: 0, seat_belts_frayed_no: 1}

  enum seat_belts_cut: {seat_belts_cut_yes: 0, seat_belts_cut_no: 1}

  enum seat_belts_torn: {seat_belts_torn_yes: 0, seat_belts_torn_no: 1}

  enum seat_belts_snagged: {seat_belts_snagged_yes: 0, seat_belts_snagged_no: 1}

  enum seat_belts_roping: {seat_belts_roping_yes: 0, seat_belts_roping_no: 1}

  enum gauges_working: {gauges_working_yes: 0, gauges_working_no: 1}

  enum rearview_mirror_placed: {rearview_mirror_placed_yes: 0, rearview_mirror_placed_no: 1}

  enum rearview_mirror_working: {rearview_mirror_working_yes: 0, rearview_mirror_working_no: 1}

  enum rearview_mirror_clean: {rearview_mirror_clean_yes: 0, rearview_mirror_clean_no: 1}

  enum registration_present: {registration_present_yes: 0, registration_present_no: 1}

  enum registration_current: {registration_current_yes: 0, registration_current_no: 1}

  enum fluids_add: {fluids_add_yes: 0, fluids_add_no: 1}

  enum deficiences_corrected: {deficiences_corrected_yes: 0, deficiences_corrected_no: 1}

  enum permits_paperwork_present: {permits_paperwork_present_yes: 0, permits_paperwork_present_no: 1}

  enum permits_paperwork_current: {permits_paperwork_current_yes: 0, permits_paperwork_current_no: 1}

  enum chains_binders_present: {chains_binders_present_yes: 0, chains_binders_present_no: 1}

  enum chains_binders_serviceable: {chains_binders_serviceable_yes: 0, chains_binders_serviceable_no: 1}

  def send_mail_about_faulty_vehicle
    Ticket::VehicleMailer.ticket_approval_email(this) if check_if_any_issue_with_vehicle == true
  end

  def check_if_any_issue_with_vehicle
        return true if 
        self.mirror_broken == 0 ||
        self.mirror_working == 1 ||
        self.mirror_placed == 1 ||
        self.tires_properly_inflated == 1 ||
        self.tires_tread == 1 ||
        self.windows_broken == 0 ||
        self.windows_missing == 0 ||
        self.doors_broken == 0 ||
        self.doors_dented == 0 ||
        self.doors_latched == 1 ||
        self.brakes_worn == 0 ||
        self.brakes_missing == 0 ||
        self.brakes_damaged == 0 ||
        self.fifth_wheel_locked == 1 ||
        self.fifth_wheel_greased == 1 ||
        self.fifth_wheel_abnormal == 0 ||
        self.hoses_secured == 1 ||
        self.hoses_hanging == 0 ||
        self.hoses_leaks == 0 ||
        self.hoses_wear == 0 ||
        self.flags_secured == 1 ||
        self.flags_serviceable == 1 ||
        self.rear_bumper_loose == 0 ||
        self.rear_bumper_missing == 0 ||
        self.rear_bumper_damaged == 0 ||
        self.license_plate_dirty == 0 ||
        self.license_plate_attached == 1 ||
        self.license_plate_sticker == 0 ||
        self.truck_bed_tire == 1 ||
        self.truck_bed_tire == 2 ||
        self.truck_bed_jack  == 1 ||
        self.truck_bed_jack  == 2 ||
        self.truck_bed_wrench  == 1 ||
        self.truck_bed_wrench  == 2 ||
        self.truck_bed_debris == 0 ||
        self.truck_bed_tools == 0 ||
        self.truck_bed_clean == 1 ||
        self.brake_lights_working == 1 ||
        self.rear_window_broken == 0 ||
        self.rear_window_missing == 0 ||
        self.rear_window_clean == 1 ||
        self.air_bags_leaks == 0 ||
        self.headlights_brights_working == 1 ||
        self.headlights_low_beams_working == 1 ||
        self.turn_signals_working == 1 ||
        self.front_bumper_attached == 1 ||
        self.windshield_broken == 0 ||
        self.windshield_missing == 0 ||
        self.windshield_clean == 1 ||
        self.wiper_blades_broken == 0 ||
        self.wiper_blades_working == 1 ||
        self.overall_interior_clean == 1 ||
        self.parking_brake_working == 1 ||
        self.horn_working == 1 ||
        self.seat_belts_working == 1 ||
        self.seat_belts_frayed == 0 ||
        self.seat_belts_cut == 0 ||
        self.seat_belts_torn == 0 ||
        self.seat_belts_snagged == 0 ||
        self.seat_belts_roping == 0 ||
        self.gauges_working == 1 ||
        self.rearview_mirror_placed == 1 ||
        self.rearview_mirror_working == 1 ||
        self.rearview_mirror_clean == 1 ||
        self.registration_present == 1 ||
        self.registration_current == 1 ||
        self.fluids_add == 0 ||
        self.deficiences_corrected == 0 ||
        self.permits_paperwork_present.present? && self.permits_paperwork_present == 1 ||
        self.permits_paperwork_current.present? && self.permits_paperwork_current == 1 ||
        self.chains_binders_present.present? && self.chains_binders_present == 1 ||
        self.chains_binders_serviceable.present? && self.chains_binders_serviceable == 1
  end

  
  scope :mills, -> {
    joins(:vehicle).
    where("vehicles.vehicle_type = ?", 2) # 2 is :mill, per app/models/vehicle.rb
  }
  
  def maintenance_available?
    if vehicle
      vehicle.mill?
    else
      rental?
    end
  end
  
  def update_status(new_status, time)
    vehicle_entry = Ticket::VehicleEntry.create!(
      vehicle: self,
      status: new_status,
      time: time
    )
  end
  
  
  def to_s
    if company?
      vehicle.to_s
    else
      manual_description
    end
  end
  
  def fuel_gallons_total
    entries.sum(:fuel_gallons)
  end
  
end
