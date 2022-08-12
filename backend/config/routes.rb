# frozen_string_literal: true

Rails.application.routes.draw do 
  get '/users', to: 'users#readAll'
  get '/users/:id', to: 'users#read'
  post '/users', to: 'users#create'
  delete '/users', to: 'users#deleteAll'
end
