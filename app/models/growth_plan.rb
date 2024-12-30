class GrowthPlan < ApplicationRecord
  belongs_to :user
  has_many :feedback_items
  has_many :progress_updates

  has_secure_token

  def to_param
    token
  end
end
