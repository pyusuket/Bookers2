Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :homes
  resources :users
  resources :books
  get 'about' => 'homes#about'
  get 'top' => 'homes#top'
end
