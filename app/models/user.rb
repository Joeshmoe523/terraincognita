class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :growth_plans, dependent: :destroy
  has_many :role_profiles, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_many :feedback_items
  after_create :create_profile

  def full_name
    user_profile.full_name
  end

  cattr_accessor :form_steps do
    %w[
      :welcome,
      :personal_info,
      :role_info,
      :complete
    ]
  end

  attr_accessor :form_step

  def form_step
    @form_step ||= :welcome
  end

  def current_role_profile
    role_profiles.where(end_date: nil).or(role_profiles.where("end_date > ?", Date.current)).order(start_date: :desc).first
  end

  private

  def create_profile
    create_user_profile(
      first_name: "",
      last_name: ""
    )
  end
end
