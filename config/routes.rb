Rails.application.routes.draw do

  root 'login#login'
  get 'home', to: 'application#home'
  get 'editProfile', to: 'application#editProfile'
  get 'friends', to: 'application#friends'
  get 'messages', to: 'application#messages'

end
