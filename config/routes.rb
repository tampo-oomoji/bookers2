Rails.application.routes.draw do
    devise_for :users
    root to: "homes#top"
  # resources :books, only: [:new, :index, :show, :create]
 resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
# get 'books/index'
  resources :users, only: [:new, :show, :edit, :index, :create, :update]

# get 'users/top'
  get 'homes/top'
  
  get "/home/about" => "homes#about" , as: "about"

  # get 'homes/about' ,as: 'about'
  
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
