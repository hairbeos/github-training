Blog::Application.routes.draw do
  namespace :api, :defaults => {:format => "json"} do
    api_version(:module => "V1", :path => {:value => "v1"}, default: true) do
      resources :articles
    end
  end
  root 'articles#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  resources :articles
  resources :users
  resources :sessions
end
