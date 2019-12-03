class User < ApplicationRecord
  has_many :products
  has_many :comments
  has_many :saling_products
  has_many :bought_products
  has_many :sold_products
end
