require "test_helper"

class Ticket::VehiclesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
