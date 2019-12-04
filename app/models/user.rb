class User < ApplicationRecord
  validates :nickname, presence: true
  validates :profile, presence: true

  has_many :products
  has_many :comments, dependent: :destroy
  has_many :saling_products
  has_many :bought_products
  has_many :sold_products
  # 中間テーブル経由でproductsを取得
  has_many :salings, through: :saling_products, source: :product
  has_many :boughts, through: :bought_products, source: :product
  has_many :solds, through: :sold_products, source: :product
  # 購入したproductsを取得
  has_many :buying_products, class_name: "BoughtProduct", foreign_key: "buyer_id"
  has_many :buyings, through: :buying_products, source: :product
  # 購入済みのproductsを取得
  has_many :accepted_products, class_name: "SoldProducts", foreign_key: "buyer_id"
  has_many :accepts, through: :accepted_products, source: :product
end
