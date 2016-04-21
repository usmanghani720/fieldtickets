require 'test_helper'

class FieldTicketsControllerTest < ActionController::TestCase
  setup do
    @field_ticket = field_tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_ticket" do
    assert_difference('FieldTicket.count') do
      post :create, field_ticket: { customer_approved_work: @field_ticket.customer_approved_work, customer_name_and_title: @field_ticket.customer_name_and_title, finished_at: @field_ticket.finished_at, job_id: @field_ticket.job_id, non_job_id: @field_ticket.non_job_id, started_at: @field_ticket.started_at }
    end

    assert_redirected_to field_ticket_path(assigns(:field_ticket))
  end

  test "should show field_ticket" do
    get :show, id: @field_ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field_ticket
    assert_response :success
  end

  test "should update field_ticket" do
    patch :update, id: @field_ticket, field_ticket: { customer_approved_work: @field_ticket.customer_approved_work, customer_name_and_title: @field_ticket.customer_name_and_title, finished_at: @field_ticket.finished_at, job_id: @field_ticket.job_id, non_job_id: @field_ticket.non_job_id, started_at: @field_ticket.started_at }
    assert_redirected_to field_ticket_path(assigns(:field_ticket))
  end

  test "should destroy field_ticket" do
    assert_difference('FieldTicket.count', -1) do
      delete :destroy, id: @field_ticket
    end

    assert_redirected_to field_tickets_path
  end
end
