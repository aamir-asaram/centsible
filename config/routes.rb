Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  resources :categories do
    resources :expenses
  end
  resources :users
end
