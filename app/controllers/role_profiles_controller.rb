class RoleProfilesController < ApplicationController
  def new
    @current_user = current_user
    @role_profile = current_user.role_profiles.new
  end

  def create
    @current_user = current_user
    @role_profile = current_user.role_profiles.new(role_profile_params)
    @role_profile.save
  end

  def show
    @current_user = current_user
    @role_profile = current_user.role_profiles.find_by(token: params[:token])
  end

  def edit
    @current_user = current_user
    @role_profile = current_user.role_profiles.find_by(token: params[:token])
  end

  def update
    @role_profile = RoleProfile.find_by!(token: params[:token])
    if @role_profile.update(role_profile_params)
      redirect_to profiles_path, notice: "Role profile was successfully updated."
    else
      render :edit
    end
  end

  private

  def role_profile_params
    params.require(:role_profile).permit(:title, :description, :start_date, :end_date, :current)
  end
end
