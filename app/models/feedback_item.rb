class FeedbackItem < ApplicationRecord
  belongs_to :user
  belongs_to :growth_plan, optional: true

  has_secure_token
end
