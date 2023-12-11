Rails.application.routes.draw do
  resources :users
  devise_for :users
  root to: 'homes#top'
  get 'homes' => 'homes#top'
  get 'about' => 'homes#about'
  resources :homes
  resources :books
end
