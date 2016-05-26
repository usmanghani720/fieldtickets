require "test_helper"

class Ticket::EmployeesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
