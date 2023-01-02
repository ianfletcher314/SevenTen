Rails.application.routes.draw do
  root "scores#index"
  resources :scores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/scores", to: "scores#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
