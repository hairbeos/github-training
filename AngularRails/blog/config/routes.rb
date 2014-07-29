Blog::Application.routes.draw do
  root "articles#index"
  # root "article#index"
  resources :articles, :defaults => { :format => 'json' }
end
