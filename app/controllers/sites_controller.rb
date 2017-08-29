class SitesController < ApplicationController
  def sitelist
    @sites = Site.all
  end
end
