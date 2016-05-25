require "test_helper"

class Ticket::DelaysControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
