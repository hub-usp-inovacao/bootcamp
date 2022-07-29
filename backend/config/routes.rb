# frozen_string_literal: true

Rails.application.routes.draw do 
  get "/", to: "application#index"
  #get "/users/:id", to: "users#read"
  get "/users/readAll", to: "users#readAll"
  post "/users", to: "users#create"
end
