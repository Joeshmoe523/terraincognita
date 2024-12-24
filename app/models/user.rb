class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :growth_plans
  has_one :user_profile, dependent: :destroy
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

  private

  def create_profile
    create_user_profile(
      first_name: "",
      last_name: ""
    )
  end
end
