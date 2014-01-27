class RatingsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy, :edit]
  
  def new
    @rating = current_user.ratings.build
  end
  
  def create
    @rating = current_user.ratings.create!(ratings_params)
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
  
  def show
    @ratings = current_user.ratings
  end
  
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to current_user, notice: "Successfully destroyed list."
  end
  
  def update
    @rating = Rating.find(params[:id])
    if @rating.update_attributes(ratings_params)
      redirect_to ratings_user_path(current_user)
    end
  end
  
  def edit
    @activity = current_user.activities.build
    @rating = Rating.find(params[:id])
    @list = @rating.lists.find_by(rating_id: params[:id])
  end
  
  private 
  
    def ratings_params
      params.require(:rating).permit(:name,
                    lists_attributes: [:id, :name, :content, :_destroy])
    end
    
    def correct_user
      @rating = current_user.ratings.find_by(id: params[:id])
      redirect_to current_user if @rating.nil?
    end
end