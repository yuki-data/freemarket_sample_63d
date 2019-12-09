FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    profile { Faker::Lorem.sentence(1) }
    avator { Faker::Lorem.sentence(1) }
    password { Faker::Internet.password(min_length: 6) }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { Faker::Name.first_name }
    last_name_kana { Faker::Name.last_name }
    year_of_birth { rand(1900..2020) }
    month_of_birth { rand(1..12) }
    day_of_birth { rand(1..31) }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
