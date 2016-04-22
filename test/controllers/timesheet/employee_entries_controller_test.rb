require 'test_helper'

class Timesheet::EmployeeEntriesControllerTest < ActionController::TestCase
  setup do
    @timesheet_employee_entry = timesheet_employee_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheet_employee_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timesheet_employee_entry" do
    assert_difference('Timesheet::EmployeeEntry.count') do
      post :create, timesheet_employee_entry: { boolean: @timesheet_employee_entry.boolean, employee_id: @timesheet_employee_entry.employee_id, end_at: @timesheet_employee_entry.end_at, minutes_worked: @timesheet_employee_entry.minutes_worked, start_at: @timesheet_employee_entry.start_at, timesheet_id: @timesheet_employee_entry.timesheet_id }
    end

    assert_redirected_to timesheet_employee_entry_path(assigns(:timesheet_employee_entry))
  end

  test "should show timesheet_employee_entry" do
    get :show, id: @timesheet_employee_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timesheet_employee_entry
    assert_response :success
  end

  test "should update timesheet_employee_entry" do
    patch :update, id: @timesheet_employee_entry, timesheet_employee_entry: { boolean: @timesheet_employee_entry.boolean, employee_id: @timesheet_employee_entry.employee_id, end_at: @timesheet_employee_entry.end_at, minutes_worked: @timesheet_employee_entry.minutes_worked, start_at: @timesheet_employee_entry.start_at, timesheet_id: @timesheet_employee_entry.timesheet_id }
    assert_redirected_to timesheet_employee_entry_path(assigns(:timesheet_employee_entry))
  end

  test "should destroy timesheet_employee_entry" do
    assert_difference('Timesheet::EmployeeEntry.count', -1) do
      delete :destroy, id: @timesheet_employee_entry
    end

    assert_redirected_to timesheet_employee_entries_path
  end
end
