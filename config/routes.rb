# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  get '/signup',      to: 'users#new'
  post '/signup',     to: 'users#create'
  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get 'events/:id/attend', to: 'events#attend', as: 'attend_event'

  resources :users do
    member do
      get :hosting_events
    end
  end
  resources :events, only: %i[new create index show]
  # http://guides.rubyonrails.org/routing.html
end
