Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :books
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]

  end
end
