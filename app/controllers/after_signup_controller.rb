class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :welcome, :personal_info, :role_info, :complete

  before_action :authenticate_user!

  def show
    @user = current_user
    @user.form_step = step

    case step
    when :welcome
    when :personal_info
      @user_profile = @user.user_profile
    when :role_info
      # TODO: Add role info (RoleProfile.new(user: @user))
    when :complete
    end

    render_wizard
  end

  def update
    @user = current_user
    @user.form_step = step

    case step
    when :welcome
    when :personal_info
      @user_profile = @user.user_profile
      @user_profile.update(user_profile_params)
    when :role_info
      # TODO: Add role info (RoleProfile.new(user: @user))
    when :complete
    end

    render_wizard @user
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :gender, :pronouns, :date_of_birth, :timezone, :location, :linkedin_url, :portfolio_url)
  end

  def finish_wizard_path
    dashboard_path
  end
end
