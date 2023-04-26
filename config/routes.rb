Rails.application.routes.draw do
  get 'search', to: "search#index"
  resources :submissions
  resources :ratings
  resources :assignments
  root to: 'page#home'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
end
