# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#new'
  get '/signup',      to: 'users#new'
  post '/signup',     to: 'users#create'
  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :users
  # http://localhost:3000/signup
  # http://localhost:3000/login
  # http://localhost:3000/users/1
  # http://guides.rubyonrails.org/routing.html
end