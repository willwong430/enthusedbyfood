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
      redirect_to chef_path(@chef), notice: "Chef was successfully created."
    else
      render 'new'
    end
  end
  
  def edit
    @activity = current_user.activities.build
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find(params[:id])
    if @chef.update_attributes(chef_params)
      flash[:success] = "Chef profile updated"
      redirect_to @chef 
    else
      render 'edit'
    end
  end
  
  def destroy
    @chef = Chef.find(params[:id])
    @chef.destroy
    redirect_to chefs_url, notice: "Chef was successfully destroyed."
  end
  
  private 
  
    def chef_params
      params.require(:chef).permit(:image, :name, :thumbnail, :key)
    end
    
end
