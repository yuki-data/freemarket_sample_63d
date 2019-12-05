class BoughtProduct < ApplicationRecord
  validates :product_id, uniqueness: true
  belongs_to :product
  belongs_to :user_profile
  belongs_to :buyer, class_name: "UserProfile"
end
