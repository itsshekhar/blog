Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :blogger do 
    resources :comments
  end
  root "blogger#index"
  # post "/add", to:"blogger#add"
  # get "/show",to:"blogger#show"
end
