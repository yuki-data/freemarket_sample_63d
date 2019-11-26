Rails.application.routes.draw do
	root to: "tets#index"
  get "/mypage", to: "user_accounts#index"
end
