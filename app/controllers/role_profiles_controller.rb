class RoleProfilesController < ApplicationController
  def create
    @role_profile = RoleProfile.new(role_profile_params)
    @role_profile.save
  end

  private

  def role_profile_params
    params.require(:role_profile).permit(:title, :description, :start_date, :end_date, :current)
  end
end
