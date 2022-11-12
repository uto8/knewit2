require 'test_helper'

class TrucksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trucks_index_url
    assert_response :success
  end

end
