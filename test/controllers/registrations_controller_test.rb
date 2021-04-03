require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  registrations_url = "/api/v1/registrations/"
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get registrations_url, as: :json
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post registrations_url, params: { registration: @registration }, as: :json
    end
    assert_response 201
    assert_equal @registration.bill_quantity, @registration.bill.length
  end

  test "should show registration" do
    get registrations_url + @registration.id.to_s, as: :json
    assert_response :success
  end

end
