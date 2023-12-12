Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'homes#top'
  get 'homes' => 'homes#top'
  get 'about' => 'homes#about'
  resources :homes
  resources :books
  patch 'users/:id' => 'user#update', as: 'update_user'
end
