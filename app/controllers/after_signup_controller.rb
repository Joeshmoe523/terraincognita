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
      @role_profile = @user.role_profiles.new
    when :complete
    end

    render_wizard
  end

  # def create
  #   @user = current_user
  #   @user.form_step = step
  #   case step
  #   when :role_info
  #     @role_profile = @user.role_profiles.create(role_profile_params)
  #   end

  #   render_wizard @user
  # end

  def update
    @user = current_user
    @user.form_step = step

    case step
    when :welcome
    when :personal_info
      @user_profile = @user.user_profile
      @user_profile.update(user_profile_params)
    when :role_info
      @role_profile = @user.role_profiles.create(role_profile_params)
    when :complete
    end

    render_wizard @user
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :gender, :pronouns, :date_of_birth, :timezone, :location, :linkedin_url, :portfolio_url)
  end

  def role_profile_params
    params.require(:role_profile).permit(:title, :description, :start_date, :end_date, :current)
  end

  def finish_wizard_path
    dashboard_path
  end
end
