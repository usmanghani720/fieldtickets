class Ticket::Vehicle < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  include TimesheetParent


  belongs_to :ticket
  belongs_to :vehicle, class_name: '::Vehicle'
  
  has_many :vehicle_entries
  
  validates :vehicle, presence: true, if: :company?
  validates :vehicle, uniqueness: { scope: :ticket }, if: :company?

  validates :mileage, presence: true

  # validates :crew_chief, presence: true
  # validates :driver, presence: true
  # validates :mirror_broken, presence: true
  # validates :mirror_working, presence: true
  # validates :mileage, presence: true
  # validates :mirror_placed, presence: true
  # validates :tires_inflated, presence: true
  # validates :tires_properly_inflated, presence: true
  # validates :tires_tread, presence: true
  # validates :windows_broken, presence: true
  # validates :windows_missing, presence: true
  # validates :doors_broken, presence: true
  # validates :doors_dented, presence: true
  # validates :doors_latched, presence: true
  # validates :brakes_worn, presence: true
  # validates :brakes_missing, presence: true
  # validates :brakes_damaged, presence: true
  # validates :fifth_wheel_locked, presence: true
  # validates :fifth_wheel_greased, presence: true
  # validates :fifth_wheel_abnormal, presence: true
  # validates :hoses_secured, presence: true
  # validates :hoses_hanging, presence: true
  # validates :hoses_leaks, presence: true
  # validates :hoses_wear, presence: true
  # validates :flags_secured, presence: true
  # validates :flags_serviceable, presence: true
  # validates :rear_bumper_loose, presence: true
  # validates :rear_bumper_missing, presence: true
  # validates :rear_bumper_damaged, presence: true
  # validates :license_plate_dirty, presence: true
  # validates :license_plate_attached, presence: true
  # validates :license_plate_sticker, presence: true
  # validates :truck_bed_tire, presence: true
  # validates :truck_bed_jack, presence: true
  # validates :truck_bed_wrench, presence: true
  # validates :truck_bed_debris, presence: true
  # validates :truck_bed_tools, presence: true
  # validates :truck_bed_clean, presence: true
  # validates :brake_lights_working, presence: true
  # validates :rear_window_broken, presence: true
  # validates :rear_window_missing, presence: true
  # validates :rear_window_clean, presence: true
  # validates :air_bags_leaks, presence: true
  # validates :headlights_brights_working, presence: true
  # validates :headlights_low_beams_working, presence: true
  # validates :turn_signals_working, presence: true
  # validates :front_bumper_attached, presence: true
  # validates :windshield_broken, presence: true
  # validates :windshield_missing, presence: true
  # validates :windshield_clean, presence: true
  # validates :wiper_blades_broken, presence: true
  # validates :wiper_blades_working, presence: true
  # validates :overall_interior_clean, presence: true
  # validates :parking_brake_working, presence: true
  # validates :horn_working, presence: true
  # validates :seat_belts_working, presence: true
  # validates :seat_belts_frayed, presence: true
  # validates :seat_belts_cut, presence: true
  # validates :seat_belts_torn, presence: true
  # validates :seat_belts_snagged, presence: true
  # validates :seat_belts_roping, presence: true
  # validates :gauges_working, presence: true
  # validates :rearview_mirror_placed, presence: true
  # validates :rearview_mirror_working, presence: true
  # validates :rearview_mirror_clean, presence: true
  # validates :registration_present, presence: true
  # validates :registration_current, presence: true
  # validates :fluids_add, presence: true
  # validates :deficiences_corrected, presence: true
  # validates :permits_paperwork_present, presence: true
  # validates :permits_paperwork_current, presence: true
  # validates :chains_binders_present, presence: true
  # validates :chains_binders_serviceable, presence: true


  validates :manual_description, presence: true, unless: :company?
  validates :manual_description, uniqueness: { scope: :ticket }, unless: :company?
  
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
