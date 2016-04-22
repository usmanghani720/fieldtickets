require 'test_helper'

class Timesheet::EquipmentEntriesControllerTest < ActionController::TestCase
  setup do
    @timesheet_equipment_entry = timesheet_equipment_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheet_equipment_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timesheet_equipment_entry" do
    assert_difference('Timesheet::EquipmentEntry.count') do
      post :create, timesheet_equipment_entry: { equipment_id: @timesheet_equipment_entry.equipment_id, fuel_gallons: @timesheet_equipment_entry.fuel_gallons, mileage_end: @timesheet_equipment_entry.mileage_end, mileage_start: @timesheet_equipment_entry.mileage_start, timesheet_id: @timesheet_equipment_entry.timesheet_id }
    end

    assert_redirected_to timesheet_equipment_entry_path(assigns(:timesheet_equipment_entry))
  end

  test "should show timesheet_equipment_entry" do
    get :show, id: @timesheet_equipment_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timesheet_equipment_entry
    assert_response :success
  end

  test "should update timesheet_equipment_entry" do
    patch :update, id: @timesheet_equipment_entry, timesheet_equipment_entry: { equipment_id: @timesheet_equipment_entry.equipment_id, fuel_gallons: @timesheet_equipment_entry.fuel_gallons, mileage_end: @timesheet_equipment_entry.mileage_end, mileage_start: @timesheet_equipment_entry.mileage_start, timesheet_id: @timesheet_equipment_entry.timesheet_id }
    assert_redirected_to timesheet_equipment_entry_path(assigns(:timesheet_equipment_entry))
  end

  test "should destroy timesheet_equipment_entry" do
    assert_difference('Timesheet::EquipmentEntry.count', -1) do
      delete :destroy, id: @timesheet_equipment_entry
    end

    assert_redirected_to timesheet_equipment_entries_path
  end
end
