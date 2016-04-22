require 'test_helper'

class Timesheet::TimesheetsControllerTest < ActionController::TestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timesheet" do
    assert_difference('Timesheet::Timesheet.count') do
      post :create, timesheet: { crew_chief_id: @timesheet.crew_chief_id, field_ticket_id: @timesheet.field_ticket_id, finalized: @timesheet.finalized, left_job_at: @timesheet.left_job_at, project: @timesheet.project, site_supervisor_id: @timesheet.site_supervisor_id, supplies_holders: @timesheet.supplies_holders, supplies_oil: @timesheet.supplies_oil, supplies_other: @timesheet.supplies_other, supplies_teeth: @timesheet.supplies_teeth }
    end

    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should show timesheet" do
    get :show, id: @timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timesheet
    assert_response :success
  end

  test "should update timesheet" do
    patch :update, id: @timesheet, timesheet: { crew_chief_id: @timesheet.crew_chief_id, field_ticket_id: @timesheet.field_ticket_id, finalized: @timesheet.finalized, left_job_at: @timesheet.left_job_at, project: @timesheet.project, site_supervisor_id: @timesheet.site_supervisor_id, supplies_holders: @timesheet.supplies_holders, supplies_oil: @timesheet.supplies_oil, supplies_other: @timesheet.supplies_other, supplies_teeth: @timesheet.supplies_teeth }
    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should destroy timesheet" do
    assert_difference('Timesheet::Timesheet.count', -1) do
      delete :destroy, id: @timesheet
    end

    assert_redirected_to timesheets_path
  end
end
