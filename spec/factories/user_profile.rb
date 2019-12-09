FactoryBot.define do
  factory :user_profile do
    nickname { Faker::Name.last_name }
    profile { Faker::Lorem.sentence(1) }
    avator { Faker::Lorem.sentence(1) }
    user
  end
end
