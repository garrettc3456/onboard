Rails.application.routes.draw do
  
  # we want to add the abilitiy to create, update, delete, and view rooms
  resources :rooms

  # sign up
  resources :users


  # home page is the list of rooms
  root "rooms#index"


end
