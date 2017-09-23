class SitesController < ApplicationController
  def index
    @sites = Site.includes(:category).all.page(params[:page]).per(2)
  end

  def show
    @site = Site.includes(:category, :reviews).find(params[:id])
    if user_signed_in?
      @trust_rating = Trust.where(user_id: current_user.id, site_id: params[:id]).pluck(:rating)[0]
      if !@trust_rating.present? 
        @trust_rating = 0
      end
      
      @performance_rating = Performance.where(user_id: current_user.id, site_id: params[:id]).pluck(:rating)[0]
      if !@performance_rating.present? 
        @performance_rating = 0
      end
      
      @feature_rating = Feature.where(user_id: current_user.id, site_id: params[:id]).pluck(:rating)[0]
      if !@feature_rating.present? 
        @feature_rating = 0
      end
    end
    
    @result = @site.rating
    @review = Review.new
  end
  
  def rating
    if params[:type] == 'trust'
      @rating = Trust.create(rating: params[:star], site_id: params[:id], user_id: current_user.id)
    elsif params[:type] == 'performance'
      @rating = Performance.create(rating: params[:star], site_id: params[:id], user_id: current_user.id)
    else
      params[:type] == 'feature'
      @rating = Feature.create(rating: params[:star], site_id: params[:id], user_id: current_user.id)
    end
    
    if @rating.save
      redirect_to site_path(params[:id]), notice: 'Rating is successfully made.'
    else
      redirect_to site_path(params[:id]), alert: 'You can give rating only once per type.'
    end
    
    @site = Site.find(params[:id])
    @result = @site.get_site_avg_rating(@site)
    @site.update(rating: @result)
  end
end
