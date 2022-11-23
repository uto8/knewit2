require 'test_helper'

class DeliveryDestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delivery_destinations_index_url
    assert_response :success
  end

  test "should get new" do
    get delivery_destinations_new_url
    assert_response :success
  end

end
