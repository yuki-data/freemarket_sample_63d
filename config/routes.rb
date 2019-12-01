Rails.application.routes.draw do
  resources :tops, only: [:index, :show]
  resources  :cwavetests, only: [:index, :create, :new]
  resources :exhibit
end
