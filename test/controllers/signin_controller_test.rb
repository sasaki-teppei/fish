require 'test_helper'

class SigninControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signin_new_url
    assert_response :success
  end

end
