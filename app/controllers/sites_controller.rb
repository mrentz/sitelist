class SitesController < ApplicationController

  def index
    @sites = Site.all
  end


  def sitelist
    @sites = Site.all
  end

  def siteinfo
    @site = Site.find(params[:id])
  end
end
