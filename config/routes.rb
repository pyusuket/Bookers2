Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resource :homes
  resource :users
  get 'about' => 'homes#about'
  get 'top' => 'homes#top'
end
