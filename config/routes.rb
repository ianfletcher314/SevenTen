Rails.application.routes.draw do
  devise_for :users
  root "scores#index"
  resources :scores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/scores", to: "scores#index"
  # Defines the root path route ("/")
  # root "articles#index"

  post "/twilio/sms", to: "scores#create", as: :twilio_sms
end
