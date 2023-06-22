Rails.application.routes.draw do
  resources :books, only: [:new, :index, :show, :create]
  get 'homes/top'
  
  get 'homes/about' ,as: 'about'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
