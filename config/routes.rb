Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  #devise_for :users
  #for whatever reason, redirection to the root doesn't work when signing up, so I have to make a new controller etc.
  devise_for :users, controllers: { registrations: "registrations" }
  resources :useful_links
  resources :campaigns
  resources :notes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
