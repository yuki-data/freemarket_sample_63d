Rails.application.routes.draw do
  root to: "user_accounts#top_page"
  get "/mypage", to: "user_accounts#index"
end
