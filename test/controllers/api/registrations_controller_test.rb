require 'test_helper'

class Api::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get api_registrations_sign_up_url
    assert_response :success
  end

  test "should get reset_password" do
    get api_registrations_reset_password_url
    assert_response :success
  end

  test "should get change_password" do
    get api_registrations_change_password_url
    assert_response :success
  end

  test "should get update" do
    get api_registrations_update_url
    assert_response :success
  end

end
