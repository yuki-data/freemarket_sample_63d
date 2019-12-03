class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :status
    validates :who_charge_shipping
    validates :way_of_shipping
    validates :shipping_region
    validates :how_long_shipping
    validates :price
  end

  belongs_to :user
  belongs_to :category
  has_one :saling_product
  has_one :bought_product
  has_one :sold_product
  belongs_to :brand
  has_many :product_images
  has_many :comments
end
