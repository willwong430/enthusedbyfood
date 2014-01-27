class FoodsController < ApplicationController
  before_action :signed_in_user
  
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
  
  private 
  
    def food_params
      params.require(:food).permit(:name, :image, :thumbnail)
    end
    
end
