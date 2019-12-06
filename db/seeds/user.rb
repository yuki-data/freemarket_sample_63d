profiles = UserProfile.create!(
  [
    { nickname: "山田", profile: "こんにちは", avator: "山田の画像" },
    { nickname: "田中", profile: "こんにちは", avator: "田中の画像" },
    { nickname: "佐藤", profile: "はじめまして", avator: "佐藤の画像" }
  ]
)

User.create!(
  [
    {
      password: "aaaaaa", email: "a@a", first_name: "a", last_name: "a",
      first_name_kana: "a", last_name_kana: "a", year_of_birth: 1,
      month_of_birth: 1, day_of_birth: 1, phone_number: 1,
      user_profile_id: profiles[0].id
    },
    {
      password: "bbbbbb", email: "b@b", first_name: "b", last_name: "b",
      first_name_kana: "b", last_name_kana: "b", year_of_birth: 1,
      month_of_birth: 1, day_of_birth: 1, phone_number: 1,
      user_profile_id: profiles[1].id
    },
    {
      password: "cccccc", email: "c@c", first_name: "c", last_name: "c",
      first_name_kana: "c", last_name_kana: "c", year_of_birth: 1,
      month_of_birth: 1, day_of_birth: 1, phone_number: 1,
      user_profile_id: profiles[2].id
    }
  ]
)