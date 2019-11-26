# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# test

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|profile|text|null: false|
|avator|string||

### Association
- belongs_to :user_profile
- belongs_to :user_address
- has_many :products
- has_many :comments
- has_many :saling_products
- has_many :purchased_products
- has_many :sold_products

## user_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|e-mail|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_phoneticGuide|string|null: false|
|last_name_phoneticGuide|string|null: false|
|year_of_birth|date|null: false|
|month_of_birth|date|null: false|
|day_of_birth|date|null: false|
|phone_number|integer|null: false|

### Association
- belongs_to :user

## user_addressテーブル

|Column|Type|Options|
|------|----|-------|
|post_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|category_id|integer|null: false|
|bland_id|integer||
|product_description|text|null: false|
|status|integer|null: false|
|who_charge_shipping|integer|null: false|
|way_of_shipping|integer|null: false|
|shipping_region|integer|null: false|
|how_long_shipping|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :saling_product
- belongs_to :purchased_product
- belongs_to :sold_product
- has_many :product_images

## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|image|string|null: false|

### Association
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|product_id|integer|null: false|
|comment|text|null: false|

### Association
- belongs_to :user

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
- has_ancestry

## blandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :product

## saling_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|saling_user_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :user

## purchased_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|purchased_user_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :user

## sold_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|sold_user_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :user

