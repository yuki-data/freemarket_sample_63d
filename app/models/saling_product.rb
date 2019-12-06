class SalingProduct < ApplicationRecord
  validates :product_id, uniqueness: true
  belongs_to :product
  belongs_to :user_profile
end
