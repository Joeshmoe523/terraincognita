class RoleProfile < ApplicationRecord
  belongs_to :user

  has_secure_token
end
