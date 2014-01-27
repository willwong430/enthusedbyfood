class UsersController < ApplicationController
  before_action :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers, :ratings]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(per_page: 5, page: params[:page])
    @activity = current_user.activities.build
  end
  
  def new
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @activity = current_user.activities.build
    @activities = @user.activities.paginate(page: params[:page])
    @rating = current_user.ratings.build
    @ratings = @user.ratings
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User oblierated."
    redirect_to users_url
  end
  
  def edit
    @user = User.find(params[:id])
    @activity = current_user.activities.build
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @activity = current_user.activities.build
    @users = @user.followed_users.paginate(page: params[:page])
    @foods = @user.followed_foods.paginate(page: params[:page])
    @chefs = @user.followed_chefs.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @activity = current_user.activities.build
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def ratings
    @title = "Ratings"
    @user = User.find(params[:id])
    @activity = current_user.activities.build
    @ratings = @user.ratings
    render 'show_ratings'
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :image, :avatar, 
                                   :description, :user_profile_id)
    end

    # Before filters
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end