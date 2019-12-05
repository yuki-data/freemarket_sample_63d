Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index, :show, :edit]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage"
  resources :card_registrations, only: [:index, :new], path: "/mypage/card"
  resources :products, only: [:show]
end
