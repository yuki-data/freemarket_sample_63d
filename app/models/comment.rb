class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user_profile
  belongs_to :product
end
