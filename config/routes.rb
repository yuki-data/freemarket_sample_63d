Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  root to: "tops#index"
  resources :tops, only: [:index, :show, :edit]
  resources :userprofile, only: [:edit]
  resources :user_registration_one, only: [:new]
  resources :user_registration_two, only: [:new]
  resources :user_registration_three, only: [:new]
  resources :user_registration_four, only: [:new]
  resources :user_registration_five, only: [:new]
  resources :user_registration_comp_of_regi, only: [:new]
  resources :user_registration_seven, only: [:new]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage" do
    collection do
      get :logout
    end
  end
  resources :card_registrations, only: [:index, :new], path: "/mypage/card"
  resources :products, only: [:show, :new, :create, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'js' }
      get 'get_category_grandchildren', defaults: { format: 'js' }
    end
    resources :purchases, only: [:index] do
      collection do
        post :pay
      end
    end
  end
end
