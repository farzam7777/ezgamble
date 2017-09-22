class SitesController < ApplicationController
  def index
    @sites = Site.includes(:category).all
  end

  def show
    @site = Site.includes(:category).find(params[:id])
  end
end
