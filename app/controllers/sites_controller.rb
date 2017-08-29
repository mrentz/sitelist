class SitesController < ApplicationController
  def sitelist
    @sites = Site.all
  end

  def siteinfo
    @site = Site.find(params[:id])
  end
end
