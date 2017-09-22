class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
  end
end
