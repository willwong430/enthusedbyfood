class ActivitiesController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: :destroy
  
  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      flash[:success] = "Activity created!"
      redirect_to root_url
    else
      @tree_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @activity.destroy
    redirect_to root_path
  end

  private
  
    def activity_params
      params.require(:activity).permit(:content)
    end
    
    def correct_user
      @activity = current_user.activities.find_by(id: params[:id])
      redirect_to root_url if @activity.nil?
    end
end