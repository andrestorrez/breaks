require 'test_helper'

class Api::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get log_in" do
    get api_auth_log_in_url
    assert_response :success
  end

  test "should get log_out" do
    get api_auth_log_out_url
    assert_response :success
  end

end
