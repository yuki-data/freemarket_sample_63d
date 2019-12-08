Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index, :show, :edit]
  resources :userprofile, only: [:edit]
  resources :user_registration_one, only: [:new]
  resources :user_registration_two, only: [:new]
  resources :user_registration_seven, only: [:new]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage"
  resources :card_registrations, only: [:index, :new], path: "/mypage/card"
  resources :products, only: [:show]
end
