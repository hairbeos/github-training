require 'api_constrains'

BlogApi::Application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      devise_for :users, controllers: { sessions: 'api/v1/authentications/sessions', registrations: 'api/v1/authentications/registrations' }
      resources :users, :only => [:index]
      resources :articles
    end
  end

  # devise_for :users
end
