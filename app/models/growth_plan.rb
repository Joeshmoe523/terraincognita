class GrowthPlan < ApplicationRecord
  belongs_to :user

  has_secure_token

  def to_param
    token
  end
end
