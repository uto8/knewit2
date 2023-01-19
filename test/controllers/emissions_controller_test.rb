require 'test_helper'

class EmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emissions_index_url
    assert_response :success
  end

end
