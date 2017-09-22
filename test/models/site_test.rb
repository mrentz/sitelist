require 'test_helper'

class SiteTest < ActiveSupport::TestCase

  
  def setup
    @site = Site.new(site: "Example Site", date: Date.today,
                     description: "Website description text", url: "site_url")
  end

  test "should be valid" do
    assert @site.valid?
  end

    test "name should be present" do
    @site.site = "     "
    assert_not @site.valid?
  end

    test "description should be present" do
    @site.description = "     "
    assert_not @site.valid?
  end

    test "url should be present" do
    @site.url = "     "
    assert_not @site.valid?
  end
   
  test "site name should be unique" do
    duplicate_site = @site.dup
    duplicate_site.site = @site.site#.upcase
    @site.save
    assert_not duplicate_site.valid?
  end
   
  test "Description should be unique" do
    duplicate_site = @site.dup
    duplicate_site.description = @site.description#.upcase
    @site.save
    assert_not duplicate_site.valid?
  end
   
  test "URL should be unique" do
    duplicate_site = @site.dup
    duplicate_site.url = @site.url#.upcase
    @site.save
    assert_not duplicate_site.valid?
  end
  

end
