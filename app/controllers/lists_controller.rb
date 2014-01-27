class ListsController < ApplicationController
  def new
    @list = List.new
    @rating = Rating.find(params[:rating_id])
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @list = @rating.lists.build
    respond_to do |format|
      if @list.save
        flash[:success] = "Success!"
        redirect_to ratings_user_page
      else
        format.html { render :new}
      end
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to ratings_user_page
  end
  
  private
  
    def list_params
      params.require(:list).permit(:name, :content)
    end
end
