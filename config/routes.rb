Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes do
  resources :bookings, only: [:new, :create]
  resources :reviews, only: [:show, :edit, :update, :destroy]
  end
  resources :bookings, only: [:index, :show, :destroy, :edit, :update] do
  resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
