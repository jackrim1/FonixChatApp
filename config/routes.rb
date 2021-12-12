Rails.application.routes.draw do
  resources :rooms
  devise_for :users
  resources :users

  get '/rooms/1', as: 'main_room'

  root to: "rooms#main_room"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
