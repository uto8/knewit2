require 'test_helper'

class MileagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mileages_index_url
    assert_response :success
  end

end
