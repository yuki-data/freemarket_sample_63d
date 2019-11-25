Rails.application.routes.draw do
  resources  :cwavetests, only: [:index]
end
