Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:new, :show, :index, :edit, :update, :destroy]
  get "/home/about" => "homes#about"

end
