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
    "未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3
  }

  enum how_long_shipping: {
    "1-2日で発送": 0, "2-3日で発送": 1, "4-7日で発送": 2
  }

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

  # def humanize_shipping_region
  #   Prefecture.find(shipping_region).name
  # end

  enum shipping_region:{
    "北海道":1, "青森県":2, "岩手県":3, "宮城県":4, "秋田県":5, "山形県":6, "福島県":7, "茨城県":8, "栃木県":9, "群馬県":10, "埼玉県":11, "千葉県":12, "東京都":13, "神奈川県":14, "新潟県":15, "富山県":16, "石川県":17, "福井県":18, "山梨県":19, "長野県":20, "岐阜県":21, "静岡県":22, "愛知県":23, "三重県":24, "滋賀県":25, "京都府":26, "大阪府":27, "兵庫県":28, "奈良県":29, "和歌山県":30, "鳥取県":31, "島根県":32, "岡山県":33, "広島県":34, "山口県":35, "徳島県":36, "香川県":37, "愛媛県":38, "高知県":39, "福岡県":40, "佐賀県":41, "長崎県":42, "熊本県":43, "大分県":44, "宮崎県":45, "鹿児島県":46, "沖縄県":47
  }

end
