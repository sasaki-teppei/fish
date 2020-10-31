require 'test_helper'

class BuyControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get buy_detail_url
    assert_response :success
  end

  test "should get done" do
    get buy_done_url
    assert_response :success
  end

end
