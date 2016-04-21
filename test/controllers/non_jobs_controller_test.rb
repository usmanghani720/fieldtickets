require 'test_helper'

class NonJobsControllerTest < ActionController::TestCase
  setup do
    @non_job = non_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:non_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create non_job" do
    assert_difference('NonJob.count') do
      post :create, non_job: { name: @non_job.name }
    end

    assert_redirected_to non_job_path(assigns(:non_job))
  end

  test "should show non_job" do
    get :show, id: @non_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @non_job
    assert_response :success
  end

  test "should update non_job" do
    patch :update, id: @non_job, non_job: { name: @non_job.name }
    assert_redirected_to non_job_path(assigns(:non_job))
  end

  test "should destroy non_job" do
    assert_difference('NonJob.count', -1) do
      delete :destroy, id: @non_job
    end

    assert_redirected_to non_jobs_path
  end
end
