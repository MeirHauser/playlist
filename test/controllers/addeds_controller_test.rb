require 'test_helper'

class AddedsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
