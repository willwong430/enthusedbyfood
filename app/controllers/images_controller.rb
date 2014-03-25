class ImagesController < ApplicationController
  def new
    @activity = current_user.activities.build
    @uploader = Chef.new.image
    @uploader.success_action_redirect = new_chef_url
  end
end