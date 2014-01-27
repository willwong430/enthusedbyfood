class ChefsController < ApplicationController
  before_action :signed_in_user
  
  def index
    @activity = current_user.activities.build
    @chefs = Chef.search(params[:search])
  end
  
  def show
    @activity = current_user.activities.build
    @chef = Chef.find(params[:id])
    chef_name = @chef.name.gsub(" ", "_").singularize
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
  
  private 
  
    def chef_params
      params.require(:chef).permit(:name, :image, :thumbnail)
    end
    
end
