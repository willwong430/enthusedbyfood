class HomeController < ApplicationController
  def index
    if signed_in?
      @activity   = current_user.activities.build
      @tree_items = current_user.tree.paginate(page: params[:page])
    end
  end
end
