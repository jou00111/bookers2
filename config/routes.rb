Rails.application.routes.draw do

  devise_for :users
  root to:'homes#top'
  resources :books,　only: [:new,  :create, :edit, :show, :destroy]
   resources :users,  only: [:edit, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
