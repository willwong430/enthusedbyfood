class ActivitiesController < ApplicationController
  before_action :signed_in_user,  only: [:home, :new, :create, :destroy]
  before_action :correct_user,    only: :destroy
  
  def new
    @activity = current_user.activities.build
    @this_detail = @activity.details.build
  end
  
  def create
    require 'RMagick'
    @activity = current_user.activities.build(activity_params)
    session[:return_to] ||= request.referer
    if @activity.save
      flash[:success] = "Activity created!"
      redirect_to session.delete(:return_to)
    else
      @tree_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    session[:return_to] ||= request.referer
    @activity.destroy
    redirect_to session.delete(:return_to)
  end

  private
  
    def correct_user
      @activity = current_user.activities.find_by(id: params[:id])
      redirect_to root_url if @activity.nil?
    end
    
    def activity_params
      params.require(:activity).permit(:title, :content, :type, :tag_list, :image, :thumbnail, :file,
                    details_attributes: [:id, :what_eaten, :where_at, :who_with, :why_eat, :when_time],
                    ratings_attributes: [:score])
    end
end