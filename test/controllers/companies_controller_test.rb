require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get companies_login_url
    assert_response :success
  end

end
