require "test_helper"

class Admin::ApprovalControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
