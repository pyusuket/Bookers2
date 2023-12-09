Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes' => 'homes#top'
  get 'about' => 'homes#about'
  resources :homes
  resources :users
  resources :books


end
