class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :saling_product
  belongs_to :bought_product
  belongs_to :sold_product
  belongs_to :brand
  has_many :product_images
  has_many :comments
end
