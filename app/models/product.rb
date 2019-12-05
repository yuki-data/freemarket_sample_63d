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

  belongs_to :user_profile
  belongs_to :category
  has_one :saling_product, dependent: :destroy
  has_one :bought_product, dependent: :destroy
  has_one :sold_product, dependent: :destroy
  belongs_to :brand
  has_many :product_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  # 購入したuser(buyer)を取得
  has_one :buyer, through: :bought_product, source: :buyer
  # 受け取ったuser(buyer)を取得
  has_one :accepter, through: :sold_product, source: :buyer

end
