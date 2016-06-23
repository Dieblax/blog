Rails.application.routes.draw do
  resources :comments
  root to: 'articles#index'
  
  resources :articles do
  	resources :comments
  end
  resources :tags
  
end
