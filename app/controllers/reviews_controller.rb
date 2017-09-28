class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  
  def create
    @user = current_user
    @review =  @user.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to site_path(params[:review][:site_id]), :notice => "Your Review has been Recorded. " }
        format.js
      else
        format.html { render :new }
        format.js
      end
     end
  end
  
  def destroy
    authorize! :destroy, @review
    respond_to do |format|
      if @review.destroy
        format.html { redirect_to sites_path, notice: 'Review is deleted Successfully.' }
        format.js
      else
        format.html { redirect_to sites_path, alert: 'Some Problem Occured.' }
        format.js
      end
    end
  end
  
  private
  
    def review_params
      params.require(:review).permit(:title, :content, :user_id, :site_id)
    end
    
    def set_review
      @review = Review.find(params[:id])
    end
end
