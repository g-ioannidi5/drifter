Rails.application.routes.draw do

  get 'home', to: 'application#home'
  get 'editProfile', to: 'application#editProfile'
end
