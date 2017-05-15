# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  $ ->
    $('.ticket_vehicle_mirror_broken_explanation').hide()
    $('.ticket_vehicle_mirror_working_explanation').hide()
    $('.ticket_vehicle_mirror_placed_explanation').hide()
    $('.ticket_vehicle_tires_properly_inflated_explanation').hide()
    $('.ticket_vehicle_tires_tread_explanation').hide()
    $('.ticket_vehicle_windows_broken_explanation').hide()
    $('.ticket_vehicle_windows_missing_explanation').hide()
    $('.ticket_vehicle_doors_broken_explanation').hide()
    $('.ticket_vehicle_doors_dented_explanation').hide()
    $('.ticket_vehicle_doors_latched_explanation').hide()
    $('.ticket_vehicle_brakes_worn_explanation').hide()
    $('.ticket_vehicle_brakes_missing_explanation').hide()
    $('.ticket_vehicle_brakes_damaged_explanation').hide()
    $('.ticket_vehicle_fifth_wheel_locked_explanation').hide()
    $('.ticket_vehicle_fifth_wheel_greased_explanation').hide()
    $('.ticket_vehicle_fifth_wheel_abnormal_explanation').hide()
    $('.ticket_vehicle_hoses_secured_explanation').hide()
    $('.ticket_vehicle_hoses_hanging_explanation').hide()
    $('.ticket_vehicle_hoses_leaks_explanation').hide()
    $('.ticket_vehicle_hoses_wear_explanation').hide()
    $('.ticket_vehicle_flags_secured_explanation').hide()
    $('.ticket_vehicle_flags_serviceable_explanation').hide()
    $('.ticket_vehicle_rear_bumper_loose_explanation').hide()
    $('.ticket_vehicle_rear_bumper_missing_explanation').hide()
    $('.ticket_vehicle_rear_bumper_damaged_explanation').hide()
    $('.ticket_vehicle_license_plate_dirty_explanation').hide()
    $('.ticket_vehicle_license_plate_attached_explanation').hide()
    $('.ticket_vehicle_license_plate_sticker_explanation').hide()
    $('.ticket_vehicle_truck_bed_tire_explanation').hide()
    $('.ticket_vehicle_truck_bed_jack_explanation').hide()
    $('.ticket_vehicle_truck_bed_wrench_explanation').hide()
    $('.ticket_vehicle_truck_bed_debris_explanation').hide()
    $('.ticket_vehicle_truck_bed_tools_explanation').hide()
    $('.ticket_vehicle_truck_bed_clean_explanation').hide()
    $('.ticket_vehicle_brake_lights_working_explanation').hide()
    $('.ticket_vehicle_rear_window_broken_explanation').hide()
    $('.ticket_vehicle_rear_window_missing_explanation').hide()
    $('.ticket_vehicle_rear_window_clean_explanation').hide()
    $('.ticket_vehicle_air_bags_leaks_explanation').hide()
    $('.ticket_vehicle_headlights_brights_working_explanation').hide()
    $('.ticket_vehicle_headlights_low_beams_working_explanation').hide()
    $('.ticket_vehicle_turn_signals_working_explanation').hide()
    $('.ticket_vehicle_front_bumper_attached_explanation').hide()
    $('.ticket_vehicle_windshield_broken_explanation').hide()
    $('.ticket_vehicle_windshield_missing_explanation').hide()
    $('.ticket_vehicle_windshield_clean_explanation').hide()
    $('.ticket_vehicle_wiper_blades_broken_explanation').hide()
    $('.ticket_vehicle_wiper_blades_working_explanation').hide()
    $('.ticket_vehicle_overall_interior_clean_explanation').hide()
    $('.ticket_vehicle_parking_brake_working_explanation').hide()
    $('.ticket_vehicle_horn_working_explanation').hide()
    $('.ticket_vehicle_seat_belts_working_explanation').hide()
    $('.ticket_vehicle_seat_belts_frayed_explanation').hide()
    $('.ticket_vehicle_seat_belts_cut_explanation').hide()
    $('.ticket_vehicle_seat_belts_torn_explanation').hide()
    $('.ticket_vehicle_seat_belts_snagged_explanation').hide()
    $('.ticket_vehicle_seat_belts_roping_explanation').hide()
    $('.ticket_vehicle_gauges_working_explanation').hide()
    $('.ticket_vehicle_rearview_mirror_placed_explanation').hide()
    $('.ticket_vehicle_rearview_mirror_working_explanation').hide()
    $('.ticket_vehicle_rearview_mirror_clean_explanation').hide()
    $('.ticket_vehicle_registration_present_explanation').hide()
    $('.ticket_vehicle_registration_current_explanation').hide()
    $('.ticket_vehicle_fluids_add_explanation').hide()
    $('.ticket_vehicle_deficiences_corrected_explanation').hide()


    $('input:radio[name="ticket_vehicle[mirror_broken]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[mirror_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[mirror_broken]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_mirror_broken_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[mirror_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[mirror_broken]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_mirror_broken_explanation').hide()


    $('input:radio[name="ticket_vehicle[mirror_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[mirror_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[mirror_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_mirror_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[mirror_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[mirror_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_mirror_working_explanation').hide()

    $('input:radio[name="ticket_vehicle[mirror_placed]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[mirror_placed]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[mirror_placed]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_mirror_placed_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[mirror_placed]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[mirror_placed]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_mirror_placed_explanation').hide()


    $('input:radio[name="ticket_vehicle[tires_properly_inflated]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[tires_properly_inflated]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[tires_properly_inflated]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_tires_properly_inflated_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[tires_properly_inflated]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[tires_properly_inflated]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_tires_properly_inflated_explanation').hide()


    $('input:radio[name="ticket_vehicle[tires_tread]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[tires_tread]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[tires_tread]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_tires_tread_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[tires_tread]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[tires_tread]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_tires_tread_explanation').hide()


    $('input:radio[name="ticket_vehicle[windows_broken]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[windows_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windows_broken]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_windows_broken_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[windows_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windows_broken]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_windows_broken_explanation').hide()


    $('input:radio[name="ticket_vehicle[windows_missing]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[windows_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windows_missing]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_windows_missing_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[windows_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windows_missing]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_windows_missing_explanation').hide()


    $('input:radio[name="ticket_vehicle[doors_broken]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[doors_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[doors_broken]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_doors_broken_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[doors_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[doors_broken]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_doors_broken_explanation').hide()


    $('input:radio[name="ticket_vehicle[doors_dented]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[doors_dented]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[doors_dented]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_doors_dented_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[doors_dented]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[doors_dented]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_doors_dented_explanation').hide()


    $('input:radio[name="ticket_vehicle[doors_latched]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[doors_latched]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[doors_latched]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_doors_latched_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[doors_latched]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[doors_latched]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_doors_latched_explanation').hide()

    $('input:radio[name="ticket_vehicle[brakes_worn]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[brakes_worn]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brakes_worn]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_brakes_worn_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[brakes_worn]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brakes_worn]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_brakes_worn_explanation').hide()


    $('input:radio[name="ticket_vehicle[brakes_missing]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[brakes_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brakes_missing]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_brakes_missing_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[brakes_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brakes_missing]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_brakes_missing_explanation').hide()

    $('input:radio[name="ticket_vehicle[brakes_damaged]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[brakes_damaged]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brakes_damaged]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_brakes_damaged_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[brakes_damaged]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brakes_damaged]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_brakes_damaged_explanation').hide()


    $('input:radio[name="ticket_vehicle[fifth_wheel_locked]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[fifth_wheel_locked]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fifth_wheel_locked]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_fifth_wheel_locked_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[fifth_wheel_locked]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fifth_wheel_locked]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_fifth_wheel_locked_explanation').hide()


    $('input:radio[name="ticket_vehicle[fifth_wheel_greased]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[fifth_wheel_greased]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fifth_wheel_greased]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_fifth_wheel_greased_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[fifth_wheel_greased]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fifth_wheel_greased]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_fifth_wheel_greased_explanation').hide()


    $('input:radio[name="ticket_vehicle[fifth_wheel_abnormal]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[fifth_wheel_abnormal]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fifth_wheel_abnormal]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_fifth_wheel_abnormal_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[fifth_wheel_abnormal]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fifth_wheel_abnormal]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_fifth_wheel_abnormal_explanation').hide()


    $('input:radio[name="ticket_vehicle[hoses_secured]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[hoses_secured]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_secured]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_hoses_secured_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[hoses_secured]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_secured]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_hoses_secured_explanation').hide()


    $('input:radio[name="ticket_vehicle[hoses_hanging]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[hoses_hanging]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_hanging]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_hoses_hanging_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[hoses_hanging]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_hanging]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_hoses_hanging_explanation').hide()


    $('input:radio[name="ticket_vehicle[hoses_leaks]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[hoses_leaks]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_leaks]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_hoses_leaks_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[hoses_leaks]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_leaks]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_hoses_leaks_explanation').hide()


    $('input:radio[name="ticket_vehicle[hoses_wear]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[hoses_wear]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_wear]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_hoses_wear_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[hoses_wear]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[hoses_wear]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_hoses_wear_explanation').hide()

    $('input:radio[name="ticket_vehicle[flags_secured]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[flags_secured]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[flags_secured]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_flags_secured_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[flags_secured]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[flags_secured]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_flags_secured_explanation').hide()


    $('input:radio[name="ticket_vehicle[flags_serviceable]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[flags_serviceable]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[flags_serviceable]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_flags_serviceable_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[flags_serviceable]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[flags_serviceable]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_flags_serviceable_explanation').hide()

    $('input:radio[name="ticket_vehicle[rear_bumper_loose]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[rear_bumper_loose]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_bumper_loose]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rear_bumper_loose_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rear_bumper_loose]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_bumper_loose]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rear_bumper_loose_explanation').hide()


    $('input:radio[name="ticket_vehicle[rear_bumper_missing]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[rear_bumper_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_bumper_missing]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rear_bumper_missing_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rear_bumper_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_bumper_missing]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rear_bumper_missing_explanation').hide()


    $('input:radio[name="ticket_vehicle[rear_bumper_damaged]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[rear_bumper_damaged]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_bumper_damaged]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rear_bumper_damaged_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rear_bumper_damaged]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_bumper_damaged]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rear_bumper_damaged_explanation').hide()


    $('input:radio[name="ticket_vehicle[license_plate_dirty]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[license_plate_dirty]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[license_plate_dirty]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_license_plate_dirty_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[license_plate_dirty]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[license_plate_dirty]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_license_plate_dirty_explanation').hide()


    $('input:radio[name="ticket_vehicle[license_plate_attached]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[license_plate_attached]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[license_plate_attached]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_license_plate_attached_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[license_plate_attached]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[license_plate_attached]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_license_plate_attached_explanation').hide()


    $('input:radio[name="ticket_vehicle[license_plate_sticker]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[license_plate_sticker]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[license_plate_sticker]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_license_plate_sticker_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[license_plate_sticker]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[license_plate_sticker]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_license_plate_sticker_explanation').hide()


    $('input:radio[name="ticket_vehicle[truck_bed_tire]"]').change ->
        if $(this).val().indexOf('damaged') >= 0 || $(this).val().indexOf('missing') >= 0
            $('input:radio[name="ticket_vehicle[truck_bed_tire]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_tire]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_truck_bed_tire_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[truck_bed_tire]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_tire]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_truck_bed_tire_explanation').hide()


    $('input:radio[name="ticket_vehicle[truck_bed_jack]"]').change ->
        if $(this).val().indexOf('damaged') >= 0 || $(this).val().indexOf('missing') >= 0
            $('input:radio[name="ticket_vehicle[truck_bed_jack]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_jack]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_truck_bed_jack_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[truck_bed_jack]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_jack]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_truck_bed_jack_explanation').hide()

    $('input:radio[name="ticket_vehicle[truck_bed_wrench]"]').change ->
        if $(this).val().indexOf('damaged') >= 0 || $(this).val().indexOf('missing') >= 0
            $('input:radio[name="ticket_vehicle[truck_bed_wrench]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_wrench]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_truck_bed_wrench_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[truck_bed_wrench]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_wrench]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_truck_bed_wrench_explanation').hide()


    $('input:radio[name="ticket_vehicle[truck_bed_debris]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[truck_bed_debris]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_debris]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_truck_bed_debris_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[truck_bed_debris]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_debris]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_truck_bed_debris_explanation').hide()

    $('input:radio[name="ticket_vehicle[truck_bed_tools]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[truck_bed_tools]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_tools]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_truck_bed_tools_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[truck_bed_tools]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_tools]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_truck_bed_tools_explanation').hide()


    $('input:radio[name="ticket_vehicle[truck_bed_clean]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[truck_bed_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_clean]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_truck_bed_clean_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[truck_bed_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[truck_bed_clean]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_truck_bed_clean_explanation').hide()


    $('input:radio[name="ticket_vehicle[brake_lights_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[brake_lights_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brake_lights_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_brake_lights_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[brake_lights_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[brake_lights_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_brake_lights_working_explanation').hide()


    $('input:radio[name="ticket_vehicle[rear_window_broken]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[rear_window_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_window_broken]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rear_window_broken_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rear_window_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_window_broken]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rear_window_broken_explanation').hide()


    $('input:radio[name="ticket_vehicle[rear_window_missing]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[rear_window_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_window_missing]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rear_window_missing_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rear_window_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_window_missing]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rear_window_missing_explanation').hide()


    $('input:radio[name="ticket_vehicle[rear_window_clean]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[rear_window_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_window_clean]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rear_window_clean_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rear_window_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rear_window_clean]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rear_window_clean_explanation').hide()


    $('input:radio[name="ticket_vehicle[air_bags_leaks]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[air_bags_leaks]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[air_bags_leaks]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_air_bags_leaks_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[air_bags_leaks]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[air_bags_leaks]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_air_bags_leaks_explanation').hide()


    $('input:radio[name="ticket_vehicle[headlights_brights_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[headlights_brights_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[headlights_brights_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_headlights_brights_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[headlights_brights_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[headlights_brights_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_headlights_brights_working_explanation').hide()

    $('input:radio[name="ticket_vehicle[headlights_low_beams_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[headlights_low_beams_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[headlights_low_beams_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_headlights_low_beams_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[headlights_low_beams_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[headlights_low_beams_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_headlights_low_beams_working_explanation').hide()


    $('input:radio[name="ticket_vehicle[turn_signals_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[turn_signals_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[turn_signals_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_turn_signals_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[turn_signals_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[turn_signals_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_turn_signals_working_explanation').hide()

    $('input:radio[name="ticket_vehicle[front_bumper_attached]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[front_bumper_attached]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[front_bumper_attached]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_front_bumper_attached_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[front_bumper_attached]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[front_bumper_attached]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_front_bumper_attached_explanation').hide()


    $('input:radio[name="ticket_vehicle[windshield_broken]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[windshield_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windshield_broken]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_windshield_broken_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[windshield_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windshield_broken]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_windshield_broken_explanation').hide()


    $('input:radio[name="ticket_vehicle[windshield_missing]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[windshield_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windshield_missing]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_windshield_missing_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[windshield_missing]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windshield_missing]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_windshield_missing_explanation').hide()


    $('input:radio[name="ticket_vehicle[windshield_clean]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[windshield_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windshield_clean]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_windshield_clean_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[windshield_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[windshield_clean]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_windshield_clean_explanation').hide()


    $('input:radio[name="ticket_vehicle[wiper_blades_broken]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[wiper_blades_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[wiper_blades_broken]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_wiper_blades_broken_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[wiper_blades_broken]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[wiper_blades_broken]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_wiper_blades_broken_explanation').hide()


    $('input:radio[name="ticket_vehicle[wiper_blades_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[wiper_blades_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[wiper_blades_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_wiper_blades_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[wiper_blades_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[wiper_blades_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_wiper_blades_working_explanation').hide()


    $('input:radio[name="ticket_vehicle[overall_interior_clean]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[overall_interior_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[overall_interior_clean]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_overall_interior_clean_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[overall_interior_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[overall_interior_clean]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_overall_interior_clean_explanation').hide()


    $('input:radio[name="ticket_vehicle[parking_brake_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[parking_brake_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[parking_brake_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_parking_brake_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[parking_brake_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[parking_brake_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_parking_brake_working_explanation').hide()

    $('input:radio[name="ticket_vehicle[horn_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[horn_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[horn_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_horn_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[horn_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[horn_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_horn_working_explanation').hide()


    $('input:radio[name="ticket_vehicle[seat_belts_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[seat_belts_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_seat_belts_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[seat_belts_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_seat_belts_working_explanation').hide()

    $('input:radio[name="ticket_vehicle[seat_belts_frayed]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[seat_belts_frayed]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_frayed]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_seat_belts_frayed_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[seat_belts_frayed]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_frayed]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_seat_belts_frayed_explanation').hide()


    $('input:radio[name="ticket_vehicle[seat_belts_cut]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[seat_belts_cut]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_cut]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_seat_belts_cut_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[seat_belts_cut]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_cut]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_seat_belts_cut_explanation').hide()


    $('input:radio[name="ticket_vehicle[seat_belts_torn]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[seat_belts_torn]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_torn]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_seat_belts_torn_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[seat_belts_torn]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_torn]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_seat_belts_torn_explanation').hide()


    $('input:radio[name="ticket_vehicle[seat_belts_snagged]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[seat_belts_snagged]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_snagged]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_seat_belts_snagged_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[seat_belts_snagged]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_snagged]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_seat_belts_snagged_explanation').hide()


    $('input:radio[name="ticket_vehicle[seat_belts_roping]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[seat_belts_roping]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_roping]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_seat_belts_roping_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[seat_belts_roping]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[seat_belts_roping]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_seat_belts_roping_explanation').hide()


    $('input:radio[name="ticket_vehicle[gauges_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[gauges_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[gauges_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_gauges_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[gauges_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[gauges_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_gauges_working_explanation').hide()


    $('input:radio[name="ticket_vehicle[rearview_mirror_placed]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[rearview_mirror_placed]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rearview_mirror_placed]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rearview_mirror_placed_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rearview_mirror_placed]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rearview_mirror_placed]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rearview_mirror_placed_explanation').hide()


    $('input:radio[name="ticket_vehicle[rearview_mirror_working]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[rearview_mirror_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rearview_mirror_working]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rearview_mirror_working_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rearview_mirror_working]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rearview_mirror_working]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rearview_mirror_working_explanation').hide()

    $('input:radio[name="ticket_vehicle[rearview_mirror_clean]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[rearview_mirror_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rearview_mirror_clean]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_rearview_mirror_clean_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[rearview_mirror_clean]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[rearview_mirror_clean]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_rearview_mirror_clean_explanation').hide()


    $('input:radio[name="ticket_vehicle[registration_present]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[registration_present]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[registration_present]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_registration_present_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[registration_present]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[registration_present]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_registration_present_explanation').hide()

    $('input:radio[name="ticket_vehicle[registration_current]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[registration_current]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[registration_current]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_registration_current_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[registration_current]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[registration_current]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_registration_current_explanation').hide()


    $('input:radio[name="ticket_vehicle[fluids_add]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[fluids_add]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fluids_add]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_fluids_add_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[fluids_add]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[fluids_add]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_fluids_add_explanation').hide()


    $('input:radio[name="ticket_vehicle[deficiences_corrected]"]').change ->
        if $(this).val().indexOf('yes') >= 0
            $('input:radio[name="ticket_vehicle[deficiences_corrected]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[deficiences_corrected]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_deficiences_corrected_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[deficiences_corrected]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[deficiences_corrected]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_deficiences_corrected_explanation').hide()


    $('input:radio[name="ticket_vehicle[permits_paperwork_present]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[permits_paperwork_present]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[permits_paperwork_present]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_permits_paperwork_present_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[permits_paperwork_present]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[permits_paperwork_present]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_permits_paperwork_present_explanation').hide()


    $('input:radio[name="ticket_vehicle[permits_paperwork_current]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[permits_paperwork_current]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[permits_paperwork_current]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_permits_paperwork_current_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[permits_paperwork_current]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[permits_paperwork_current]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_permits_paperwork_current_explanation').hide()


    $('input:radio[name="ticket_vehicle[chains_binders_present]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[chains_binders_present]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[chains_binders_present]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_chains_binders_present_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[chains_binders_present]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[chains_binders_present]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_chains_binders_present_explanation').hide()


    $('input:radio[name="ticket_vehicle[chains_binders_serviceable]"]').change ->
        if $(this).val().indexOf('no') >= 0
            $('input:radio[name="ticket_vehicle[chains_binders_serviceable]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[chains_binders_serviceable]"]:checked').parent().css("background-color", "red")
            $('.ticket_vehicle_chains_binders_serviceable_explanation').show()
        else
            $('input:radio[name="ticket_vehicle[chains_binders_serviceable]"]:not(:checked)').parent().css("background-color", "white")
            $('input:radio[name="ticket_vehicle[chains_binders_serviceable]"]:checked').parent().css("background-color", "green")
            $('.ticket_vehicle_chains_binders_serviceable_explanation').hide()