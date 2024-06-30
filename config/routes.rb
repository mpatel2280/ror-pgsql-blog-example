Rails.application.routes.draw do
  resources :comments
  mount Motor::Admin => '/motor_admin'

  require 'resque/server'
  require 'sidekiq/web'
  
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  # root "posts#index"

  #root "articles#index"

  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"

  resources :articles
  resources :posts

  mount Resque::Server.new, at: "/resque"
  
  mount Sidekiq::Web => '/sidekiq'

end
