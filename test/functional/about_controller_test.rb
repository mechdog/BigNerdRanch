require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get company" do
    get :company
    assert_response :success
  end

end
