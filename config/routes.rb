Rails.application.routes.draw do
get 'home/about' => 'homes#about', as:'about'
  devise_for :users
  root to:'homes#top'
  resources :books,　only: [:new,  :create, :edit, :update, :show, :destroy]
  resources :users,  only: [:edit, :index, :update, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
