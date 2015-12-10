Rails.application.routes.draw do
  resources :friendships

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
  
   resources :users, :only => [:show] do
    member do
      post "follow" => "friendships#create"
      delete "unfollow" => "friendships#destroy"
  end
  end
  
  resources :posts do
  member do
    put "like" => "posts#upvote"
    put "dislike" => "posts#downvote"
    put "unvoteUp" => "posts#unvote_up"
    put "unvoteDown" => "posts#unvote_down"
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
  get 'user/:username', to: 'application#show'
  get 'users/:id', to: 'application#show'
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
 
  match 'users' => 'application#users', via: :get
  match 'find_friends', :to => 'application#findFriends', via: :get

end