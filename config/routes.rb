Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :answers, except: [:index, :show]
  end

  # Defines the root path route ("/")
  root "questions#index"
end
