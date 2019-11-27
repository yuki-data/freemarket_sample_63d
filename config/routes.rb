Rails.application.routes.draw do
  root to: "tets#index"
  resources :tops, only: [:index]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage"
  resources :card_registrations, only: [:index], path: "/mypage/card"
end
