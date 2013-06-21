class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @activity   = current_user.activities.build
      @tree_items = current_user.tree.paginate(page: params[:page])
    end 
  end

  def about
  end

  def start
  end
  
  def mission
  end
  
  def contact
  end
end
