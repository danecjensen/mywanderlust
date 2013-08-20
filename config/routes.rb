Wanderlust::Application.routes.draw do
  resources :trips


  resources :destinations


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "trips#new"
  devise_for :users
  resources :users
end