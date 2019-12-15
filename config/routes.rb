Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :tops, only: [:index, :show, :edit]
  resources :userprofile, only: [:edit]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage" do
    collection do
      get :logout
    end
  end
  resources :card_registrations, only: [:index, :new], path: "/mypage/card"

  resources :signup, only: [:new, :create]

    resources :products, only: [:show, :new, :create] do
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        get 'get_shipping_method'
       end
      resources :purchases, only: [:index] do
        collection do
          post :pay
        end
      end
  end
end
