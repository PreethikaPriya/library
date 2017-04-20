Rails.application.routes.draw do
  resources :statuses
  resources :book_users
  resources :categories
  resources :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"
end
