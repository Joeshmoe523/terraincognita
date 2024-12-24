class ProfilesController < ApplicationController
  def index
    @profile = current_user.user_profile

    # @role_profiles = current_user.role_profiles
  end
end
