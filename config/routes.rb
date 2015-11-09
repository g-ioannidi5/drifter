Rails.application.routes.draw do

  root 'login#index'
  get 'home', to: 'application#home'
  get 'editProfile', to: 'application#editProfile'
  get 'friends', to: 'application#friends'
  get 'messages', to: 'application#messages'

end
