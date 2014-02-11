class CuisinesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: :edit
  
  def index
    @activity = current_user.activities.build
    @cuisines = Cuisine.search(params[:search])
  end
  
  def show
    @activity = current_user.activities.build
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @activity = current_user.activities.build
    @cuisine = Cuisine.new  
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @activity = current_user.activities.build
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      flash[:success] = "Enthused with #{@cuisine.name}"
      redirect_to cuisine_path
    else
      render 'new'
    end
  end
  
  def edit
    @activity = current_user.activities.build
    @cuisine = Cuisine.find(params[:id])
  end
  
  def update
    @cuisine = Cuisine.find(params[:id])
    if @cuisine.update_attributes(cuisine_params)
      flash[:success] = "Cuisine profile updated"
      redirect_to @cuisine 
    else
      render 'edit'
    end
  end
  
  private 
  
    def cuisine_params
      params.require(:cuisine).permit(:name, :image, :thumbnail, :content)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end