class ProductTypesController < ApplicationController

  def index
    @activity = current_user.activities.build
    @product_types = ProductType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_types }
    end
  end

  def show
    @activity = current_user.activities.build
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product_type }
    end
  end

  def new
    @activity = current_user.activities.build
    @product_type = ProductType.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_type }
    end
  end

  def edit
    @activity = current_user.activities.build
    @product_type = ProductType.find(params[:id])
  end

  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to @product_type, notice: 'Product type was successfully created.' }
        format.json { render json: @product_type, status: :created, location: @product_type }
      else
        format.html { render action: "new" }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      if @product_type.update_attributes(product_type_params)
        format.html { redirect_to @product_type, notice: 'Product type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    @product_type = ProductType.find(params[:id])
    @product_type.destroy

    respond_to do |format|
      format.html { redirect_to product_types_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
    def product_type_params
      params.require(:product_type).permit(:name,
                                           fields_attributes: [:id, :name, :field_type, :required, :_destroy])
    end
end