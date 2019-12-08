Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  root to: "tops#index"
  resources :tops, only: [:index, :show, :edit]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage" do
    collection do
      get :logout
    end
  end
  resources :card_registrations, only: [:index, :new], path: "/mypage/card"
  resources :products, only: [:show] do
    resources :purchases, only: [:index] do
      collection do
        post :pay
      end
    end
  end
  resources :product do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_shipping_method'
    end
  end
end
