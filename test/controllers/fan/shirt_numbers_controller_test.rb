require "test_helper"

class Fan::ShirtNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fan_shirt_numbers_new_url
    assert_response :success
  end

  test "should get create" do
    get fan_shirt_numbers_create_url
    assert_response :success
  end
end
