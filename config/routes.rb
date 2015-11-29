Rails.application.routes.draw do
  resources :posts

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'application#home', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  root to: 'application#home'
  # match 'about', :to => 'drifter#about', via: :get

  # match 'profile', :to => 'drifter#profile', via: :get
  # match 'beenTo', :to => 'drifter#beenTo', via: :get
  # match 'wishTo', :to => 'drifter#wishTo', via: :get

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root 'drifter#index'
  get 'home', to: 'application#home'
  get 'editProfile', to: 'application#editProfile'
  get 'friends', to: 'application#friends'
  get 'messages', to: 'application#messages'

end