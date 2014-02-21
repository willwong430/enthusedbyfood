class ProductFieldsController < ApplicationController

  private
  
    def product_fields_params
      params.require(:product_field).permit(:field_type, :name, :required)
    end
    
end