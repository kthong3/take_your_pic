Rails.application.routes.draw do
  root 'users#index'
  resources :user
end
