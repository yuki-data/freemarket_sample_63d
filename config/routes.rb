Rails.application.routes.draw do
  resources :tops, only: [:index]
  resources :exhibit
end
