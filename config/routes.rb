Rails.application.routes.draw do
<<<<<<< HEAD
  root to: "tets#index"
  resources :user_accounts, only: [:index], path: "mypage"
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exhibit
>>>>>>> master
end
