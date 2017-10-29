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
    @site = Site.new(post_params)
    
    if @site.save
      flash[:success] = "Website successfully saved!"
      redirect_to site_path(@site)
    else
      render 'new'
    end

  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path                    
  end
  
  private
  def post_params
    params.require(:site).permit(:site, :date, :description, :url)
  end
  
end
