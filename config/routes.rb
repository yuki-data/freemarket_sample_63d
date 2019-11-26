Rails.application.routes.draw do
  root to: "tets#index"
  resources :user_accounts, only: [:index], path: "mypage"
end
