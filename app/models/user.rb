class User < ApplicationRecord
  validates :nickname, presence: true
  validates :profile, presence: true

  has_many :products
  has_many :comments, dependent: :destroy
  has_many :saling_products
  has_many :bought_products
  has_many :sold_products
end
