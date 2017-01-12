require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get validatebyinstagram" do
    get login_validatebyinstagram_url
    assert_response :success
  end

end
