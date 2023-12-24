Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'



  resources :users, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :books, only: [:new, :create, :edit, :update, :index, :show, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]

  end
  get 'home/about', to: 'homes#about', as: 'about'

end
