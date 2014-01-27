class RelationshipsController < ApplicationController
  before_action :signed_in_user
  
  respond_to :html, :js
  
  def create
    if params[:relationship][:followed_id]
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      respond_with @user
    elsif params[:relationship][:food_id]
      @food = Food.find(params[:relationship][:food_id])
      current_user.enthuse!(@food)
      respond_with @food
    elsif params[:relationship][:chef_id]
      @chef = Chef.find(params[:relationship][:chef_id])
      current_user.patron!(@chef)
      respond_with @chef
    end
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    @food = Relationship.find(params[:id]).food
    @chef = Relationship.find(params[:id]).chef
    if @user
      current_user.unfollow!(@user)
      respond_with @user
    elsif @food
      current_user.unenthuse!(@food)
      respond_with @food
    elsif @chef
      current_user.unpatron!(@chef)
      respond_with @chef
    end
  end  

  private
    
    def user?
      current_uri = request.original_url
      current_uri.include?('users')
    end
    
    def food?
      !params[:food_id].nil?
    end
end