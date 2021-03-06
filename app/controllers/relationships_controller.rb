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
    elsif params[:relationship][:culture_id]
      @culture = Culture.find(params[:relationship][:culture_id])
      current_user.patron!(@culture)
      respond_with @culture
    elsif params[:relationship][:cuisine_id]
      @cuisine = Cuisine.find(params[:relationship][:cuisine_id])
      current_user.adore!(@cuisine)
      respond_with @cuisine
    end
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    @food = Relationship.find(params[:id]).food
    @chef = Relationship.find(params[:id]).chef
    @cuisine = Relationship.find(params[:id]).cuisine
    if @user
      current_user.unfollow!(@user)
      respond_with @user
    elsif @food
      current_user.unenthuse!(@food)
      respond_with @food
    elsif @chef
      current_user.unpatron!(@chef)
      respond_with @chef
    elsif @cuisine
      current_user.unadore!(@cuisine)
      respond_with @cuisine
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