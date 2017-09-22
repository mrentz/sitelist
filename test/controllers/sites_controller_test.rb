require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest

    test "should get sitelist" do
    get sites_path
    assert_response :success
    assert_select "h1", "List of Websites"
  end

    test "should get new website form page" do
    get new_site_path
    assert_response :success
    assert_select "h1", "Save Your Favourite Website"
    end

end
