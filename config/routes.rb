Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  get 'homes/index'
  get 'homes/show'
  get 'homes/new'
  get 'homes/edit'
  get 'homes/create'
  get 'homes/update'
  get 'homes/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :homes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
