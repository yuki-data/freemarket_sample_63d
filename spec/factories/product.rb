FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(1) }
    status { rand(1..10) }
    who_charge_shipping { rand(1..10) }
    way_of_shipping { rand(1..10) }
    shipping_region { rand(1..10) }
    how_long_shipping { rand(1..10) }
    price { Faker::Commerce.price }
    user_profile
    brand
    category
  end
end
