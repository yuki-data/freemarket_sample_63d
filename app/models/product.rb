class Product < ApplicationRecord
  after_create :create_saling_product

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

  enum status: {
    "新品、未使用": 0,
    "未使用に近い": 1,
    "目立った汚れや傷なし": 2,
    "やや汚れや傷あり": 3,
    "傷や汚れあり": 4,
    "全体的に状態が悪い": 5
  }

  enum who_charge_shipping: {
    "送料込み（出品者負担）": 0, "着払い（購入者負担）": 1
  }

  enum way_of_shipping: {
    "未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3,
    "普通郵便（定型、定型外）": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8
  }

  enum how_long_shipping: {
    "1-2日で発送": 0, "2-3日で発送": 1, "4-7日で発送": 2
  }

  belongs_to :user_profile
  belongs_to :category
  has_one :saling_product, dependent: :destroy
  has_one :bought_product, dependent: :destroy
  has_one :sold_product, dependent: :destroy
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images

  has_many :comments, dependent: :destroy
  # 購入したuser(buyer)を取得
  has_one :buyer, through: :bought_product, source: :buyer
  # 受け取ったuser(buyer)を取得
  has_one :accepter, through: :sold_product, source: :buyer

  def create_saling_product
    SalingProduct.create(user_profile_id: user_profile.id, product_id: id)
  end

  def buy_product(buyer)
    if buyer.instance_of?(User)
      buyer = buyer.user_profile
    end
    BoughtProduct.create(user_profile_id: user_profile.id, product_id: id, buyer_id: buyer.id)
    saling_product.destroy
  end

  def sell_out_product
    SoldProduct.create(user_profile_id: user_profile.id, product_id: id, buyer_id: buyer.id)
    bought_product.destroy
  end

  def humanize_shipping_region
    Prefecture.find(shipping_region).name
  end

  def self.filter_by_category(category_name)
    products = Product.all
    filtered = products.select { |p| p.category.root.name == category_name }
    filtered.take(10)
  end
end
