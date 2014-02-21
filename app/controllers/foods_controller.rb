class FoodsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: [:edit, :destroy]
  
  def index
    @activity = current_user.activities.build
    @food = Food.new
    @foods = Food.search(params[:search])
    @tagged_activities = Activity.tagged_with(["Chinese"])
    @chefs = Chef.paginate(per_page: 5, page: params[:page])
  end
  
  def show
    @activity = current_user.activities.build
    @food = Food.find_by_name(params[:id])
  end

  def new
    @food = Food.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @activity = current_user.activities.build
    @food = Food.new(food_params)
    if @food.save
      flash[:success] = "Enthused by #{@food.name}"
      redirect_to cultivate_path
    else
      render 'new'
    end
  end
  
  def edit
    @activity = current_user.activities.build
    @food = Food.find_by_name(params[:id])
  end
  
  def update
    @food = Food.find_by_name(params[:id])
    if @food.update_attributes(food_params)
      flash[:success] = "Food profile updated"
      redirect_to @food 
    else
      render 'edit'
    end
  end
  
  def destroy
    @food = Food.find_by_name(params[:id])
    @food.destroy
    redirect_to root_path
  end
  
  private 
  
    def food_params
      params.require(:food).permit(:name, :image, :avatar, :content, :product_type_id)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
