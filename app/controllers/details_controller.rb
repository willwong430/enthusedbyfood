class DetailsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
  def create
    @detail = @activity.detail.build(:where_at => params[:details])
    if @detail.save
      redirect_to root_url
    end
  end

  def show
    require "net/http"
    require "nokogiri"
  
    uri = URI("http://en.wikipedia.org/w/api.php?action=query&prop=extracts&format=xml&exsentences=10&explaintext=&exsectionformat=plain&titles=Rice")
    res = Net::HTTP.get_response(uri)     #<Net::HTTPOK:0x000001055b3d98>
    xml = Nokogiri::XML::Document.parse(res.body)
    @extract = xml.xpath("api/query/pages/page/extract").inner_text
  end

end