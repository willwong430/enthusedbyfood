class StaticPagesController < ApplicationController

  def about
    if signed_in?
      @activity = current_user.activities.build
    end
  end

  def start
  end
  
  def mission
    if signed_in?
      @activity = current_user.activities.build
    end
  end
  
  def contact
    if signed_in?
      @activity = current_user.activities.build
    end
  end
  
  def cultivate
    unless !signed_in?
      @activity = current_user.activities.build
    end
    @food = Food.new
    @foods = Food.search(params[:search])

    require "net/http"
    require 'oauth'
    
    base_uri = "http://en.wikipedia.org/w/api.php?action=query&prop=extracts&format=xml&exsentences=10&explaintext=&exsectionformat=plain&titles="
    
    @food_array = []
    @foods.each do |food|
      food_name = food.name.gsub(" ", "_").singularize
      uri = base_uri + food_name
      uri_1 = URI(uri)
      res_1 = Net::HTTP.get_response(uri_1)     #<Net::HTTPOK:0x000001055b3d98>
      xml_1 = Nokogiri::XML::Document.parse(res_1.body).at("api/query/pages/page/extract").inner_text
      @food_array.push(xml_1)
    end
  end
  
  def discover
    @users = User.paginate(per_page: 5, page: params[:page])
    if signed_in?
      @activity = current_user.activities.build
    else
      redirect_to cultivate_path
    end
  end
    
end
