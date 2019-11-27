Rails.application.routes.draw do
  root to: "tets#index"
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage"
  get "/mypage/card", to: "user_accounts#card"
end
