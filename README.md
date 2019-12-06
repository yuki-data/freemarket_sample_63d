## users_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|nickname|string|null: false|
|profile|text||
|avator|string||

### Association
- belongs_to :user
- has_one :user_address
- has_many :products
- has_many :comments, dependent: :destroy
- has_many :saling_products
- has_many :bought_products
- has_many :sold_products
- has_many :salings, through: :saling_products, source: :product
- has_many :boughts, through: :bought_products, source: :product
- has_many :solds, through: :sold_products, source: :product
- has_many :buying_products, class_name: "BoughtProduct", foreign_key: "buyer_id"
- has_many :buyings, through: :buying_products, source: :product
- has_many :accepted_products, class_name: "SoldProduct", foreign_key: "buyer_id"
- has_many :accepts, through: :accepted_products, source: :product


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|year_of_birth|integer|null: false|
|month_of_birth|integer|null: false|
|day_of_birth|integer|null: false|
|phone_number|integer|null: false|

### Association
- has_one :user_profile

## user_addressテーブル

|Column|Type|Options|
|------|----|-------|
|user_profile_id|integer|foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer||

### Association
- belongs_to :user_profile

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_profile_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|status|integer|null: false|
|who_charge_shipping|integer|null: false|
|way_of_shipping|integer|null: false|
|shipping_region|integer|null: false|
|how_long_shipping|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user_profile
- belongs_to :category
- belongs_to :saling_product
- belongs_to :bought_product
- belongs_to :sold_product
- belongs_to :brand
- has_many :product_images
- has_many :comments
- has_one :buyer, through: :bought_product, source: :buyer
- has_one :accepter, through: :sold_product, source: :buyer

## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_profile_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user_profile
- belongs_to :product

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :product

## saling_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_profile_id|integer|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user_profile

## bought_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_profile_id|integer|foreign_key: true|
|buyer_id|integer|foreign_key: { to_table: :user_profiles }|

### Association
- belongs_to :product
- belongs_to :user_profile
- belongs_to :buyer, class_name: "UserProfile"

## sold_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_profile_id|integer|foreign_key: true|
|buyer_id|integer|foreign_key: { to_table: :user_profiles }|

### Association
- belongs_to :product
- belongs_to :user_profile
- belongs_to :buyer, class_name: "UserProfile"
