class CulturesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: :edit
  
  def index
    @activity = current_user.activities.build
    @cultures = Culture.search(params[:search])
  end
  
  def show
    @activity = current_user.activities.build
    @culture = Culture.find(params[:id])
  end

  def new
    @activity = current_user.activities.build
    @culture = Culture.new  
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @activity = current_user.activities.build
    @culture = Culture.new(culture_params)
    if @culture.save
      flash[:success] = "Enthused by #{@culture.name}"
      redirect_to culture_path
    else
      render 'new'
    end
  end
  
  def edit
    @activity = current_user.activities.build
    @culture = Culture.find_by_name(params[:id])
  end
  
  def update
    @culture = Culture.find_by_name(params[:id])
    if @culture.update_attributes(culture_params)
      flash[:success] = "culture profile updated"
      redirect_to @culture 
    else
      render 'edit'
    end
  end
  
  private 
  
    def culture_params
      params.require(:culture).permit(:name, :image, :thumbnail, :content)
    end
    
end
