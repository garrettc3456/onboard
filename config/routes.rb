Rails.application.routes.draw do
  
  # we want to add the abilitiy to create, update, delete, and view rooms
  resources :rooms do
  	# because orders are always on rooms, 
  	# we nest the resources (look at railsguides for more info)
  	resources :orders
  	# it is plural because you can place multiple orders
  end

  # sign up
  resources :users
  	resources :orders
  	

  # log in and log out
  # singular resource because we only want to do this once
  resource :session

  # home page is the list of rooms
  root "rooms#index"


end
