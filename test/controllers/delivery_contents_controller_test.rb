require 'test_helper'

class DeliveryContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delivery_contents_index_url
    assert_response :success
  end

end
