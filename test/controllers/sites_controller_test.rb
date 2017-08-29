require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get sitelist" do
    get sites_sitelist_url
    assert_response :success
  end

end
