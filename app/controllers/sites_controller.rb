class SitesController < ApplicationController
  def sitelist
    @sites = Site.all
  end

  def siteinfo
  end
end
