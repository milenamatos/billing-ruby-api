require "test_helper"

class BillsControllerTest < ActionDispatch::IntegrationTest
  bills_url = "/api/v1/bills/"
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get bills_url, as: :json
    assert_response :success
  end

  test "should show bill" do
    get bills_url + @bill.registration_id.to_s, as: :json
    assert_response :success
  end

end
