Rails.application.routes.draw do
  root to: "user_accounts#top_page"
  resources :user_accounts, only: ["index"]
end
