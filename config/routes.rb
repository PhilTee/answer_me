Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #devise_scope :user do
  #  # Redirects signing out users back to sign-in
  #  get "users", to: "devise/sessions#new"
  #end

  devise_for :users, only: [:session, :registration]
  
  resources :questions do
    resources :answers, except: [:index, :show]
  end

  # Defines the root path route ("/")
  root "application#redirect"
end
