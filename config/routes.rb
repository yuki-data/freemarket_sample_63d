Rails.application.routes.draw do
  get '/', to: 'user_accounts#index'
end
