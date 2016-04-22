require 'test_helper'

class Timesheet::ScaffoldEntriesControllerTest < ActionController::TestCase
  setup do
    @timesheet_scaffold_entry = timesheet_scaffold_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheet_scaffold_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timesheet_scaffold_entry" do
    assert_difference('Timesheet::ScaffoldEntry.count') do
      post :create, timesheet_scaffold_entry: { equipment_id: @timesheet_scaffold_entry.equipment_id, fuel_gallons: @timesheet_scaffold_entry.fuel_gallons, mileage_end: @timesheet_scaffold_entry.mileage_end, mileage_start: @timesheet_scaffold_entry.mileage_start, timesheet_id: @timesheet_scaffold_entry.timesheet_id }
    end

    assert_redirected_to timesheet_scaffold_entry_path(assigns(:timesheet_scaffold_entry))
  end

  test "should show timesheet_scaffold_entry" do
    get :show, id: @timesheet_scaffold_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timesheet_scaffold_entry
    assert_response :success
  end

  test "should update timesheet_scaffold_entry" do
    patch :update, id: @timesheet_scaffold_entry, timesheet_scaffold_entry: { equipment_id: @timesheet_scaffold_entry.equipment_id, fuel_gallons: @timesheet_scaffold_entry.fuel_gallons, mileage_end: @timesheet_scaffold_entry.mileage_end, mileage_start: @timesheet_scaffold_entry.mileage_start, timesheet_id: @timesheet_scaffold_entry.timesheet_id }
    assert_redirected_to timesheet_scaffold_entry_path(assigns(:timesheet_scaffold_entry))
  end

  test "should destroy timesheet_scaffold_entry" do
    assert_difference('Timesheet::ScaffoldEntry.count', -1) do
      delete :destroy, id: @timesheet_scaffold_entry
    end

    assert_redirected_to timesheet_scaffold_entries_path
  end
end
