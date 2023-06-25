Rails.application.routes.draw do
    devise_for :users
  # resources :books, only: [:new, :index, :show, :create]
 resources :books, only: [:new, :index, :show, :create, :edit, :update]
# get 'books/index'
  resources :users, only: [:show, :edit, :index, :create, :update]

get 'users/top'
  get 'homes/top'

  get 'homes/about' ,as: 'about'

  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
