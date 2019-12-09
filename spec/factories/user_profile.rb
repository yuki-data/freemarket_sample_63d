FactoryBot.define do
  factory :user_profile do
    nickname { Faker::Name.last_name }
    profile { Faker::Lorem.sentence(word_count: 10) }
    avator { Faker::Lorem.sentence(word_count: 10) }
    user
  end
end
