class SitesController < ApplicationController

  def index
    @sites = Site.all
  end


  def sitelist
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    site = Site.new(post_params)

    if site.save
      redirect_to site_path(site)
    else
      redirect_to new_site_path
    end


  end


  private
  def post_params
    params.require(:site).permit(:site, :date, :description, :url)
  end
  
end
