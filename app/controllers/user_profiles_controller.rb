class UserProfilesController < ApplicationController
  
  def index
    @user_profiles = UserProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_profiles }
    end
  end
  
  def show
    @user_profile = UserProfile.find(params[:id])
    @activity = current_user.activities.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_profile }
    end
  end
  
  def edit
    @user_profile = UserProfile.find(params[:id])
    @activity = current_user.activities.build
  end
  
  def new
    @user_profile = UserProfile.new
    @activity = current_user.activities.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_profile }
    end
  end

  def create
    @user_profile = UserProfile.new(userprofile_params)
    
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render json: @user_profile, status: :created, location: @user_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @user_profile = UserProfile.find(params[:id])

    respond_to do |format|
      if @user_profile.update_attributes(userprofile_params)
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy

    respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :no_content }
    end
  end
  
  private
  
    def userprofile_params
      params.require(:user_profile).permit(:name, 
                                        fields_attributes: [:field_type, :name, :required])
    end
end
