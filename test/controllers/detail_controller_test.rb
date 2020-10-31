require 'test_helper'

class DetailControllerTest < ActionDispatch::IntegrationTest
  test "should get done" do
    get detail_done_url
    assert_response :success
  end

end
