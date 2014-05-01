Rails.application.routes.draw do
  
  # we want to add the abilitiy to create, update, delete, and view rooms
  resources :rooms

  # sign up
  resources :users

  # log in and log out
  # singular resource because we only want to do this once
  resource :session

  # home page is the list of rooms
  root "rooms#index"


end
