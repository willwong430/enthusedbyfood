class UserFieldsController < ApplicationController
  
  private
    
    def userfield_params
      params.require(:field).permit(:field_type, :name, :required)
    end
end
