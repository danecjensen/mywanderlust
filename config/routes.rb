Wanderlust::Application.routes.draw do
  resources :trips do
    resources :destination_details, only: [:index], controller: 'trips/destination_details'
  end


  resources :destinations


  authenticated :user do
    root :to => 'trips#new'
  end
  root :to => "trips#new"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  match 'home' => 'home#index'
  match 'about' => 'home#about'
  match 'trips/share' => 'trips#share'
end
