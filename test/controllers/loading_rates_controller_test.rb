require 'test_helper'

class LoadingRatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loading_rates_index_url
    assert_response :success
  end

end
