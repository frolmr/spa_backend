require 'api_constraints'

Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :posts
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
      resources :posts
      get 'user' => 'users#show'
      post 'update_user' => 'users#update'
    end
  end
end
