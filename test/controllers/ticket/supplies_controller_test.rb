require "test_helper"

class Ticket::SuppliesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
