user_registered = User.create!(
  password: "aaaaaa", email: Faker::Internet.email, first_name: "a", last_name: "a",
  first_name_kana: "a", last_name_kana: "a", year_of_birth: 1,
  month_of_birth: 1, day_of_birth: 1, phone_number: 1,
)
user = UserProfile.create!(nickname: "山田", profile: "こんにちは", avator: "山田の画像", user_id: user_registered.id)
brand = Brand.create!(name: "シャネル")
category = Category.create!(name: "腕時計")

product = Product.create!(
  name: "腕時計（中古品）",
  description: "セイコーの時計です。電池切れです。",
  status: 1,
  who_charge_shipping: 1,
  way_of_shipping: 1,
  shipping_region: 1,
  how_long_shipping: 1,
  price: 3900,
  brand_id: brand.id,
  category_id: category.id,
  user_profile_id: user.id
)
