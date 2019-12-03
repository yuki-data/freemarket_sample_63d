class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :saling_product
  has_one :bought_product
  has_one :sold_product
  belongs_to :brand
  has_many :product_images
  has_many :comments
end
