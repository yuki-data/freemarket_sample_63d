Rails.application.routes.draw do
  resources :tops, only: [:index]
  resources  :cwavetests, only: [:index, :create, :new]
  resources :exhibit
end
