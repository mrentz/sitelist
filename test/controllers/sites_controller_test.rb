require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get sitelist" do
    get sites_path
    assert_response :success
  end

end
