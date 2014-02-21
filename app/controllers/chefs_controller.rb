class ChefsController < ApplicationController
  before_action :signed_in_user
  
  def index
    @activity = current_user.activities.build
    @chefs = Chef.search(params[:search])
  end
  
  def show
    @activity = current_user.activities.build
    @chef = Chef.find(params[:id])
  end

  def new
    @activity = current_user.activities.build
    @chef = Chef.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @activity = current_user.activities.build
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Enthused by #{@chef.name}"
      redirect_to chefs_path(@chef)
    else
      render 'new'
    end
  end
  
  def edit
    @activity = current_user.activities.build
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find_by_name(params[:id])
    if @chef.update_attributes(chef_params)
      flash[:success] = "Chef profile updated"
      redirect_to @chef 
    else
      render 'edit'
    end
  end
  
  private 
  
    def chef_params
      params.require(:chef).permit(:name, :image, :thumbnail)
    end
    
end
