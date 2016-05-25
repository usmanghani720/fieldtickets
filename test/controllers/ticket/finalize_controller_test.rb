require "test_helper"

class Ticket::FinalizeControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
