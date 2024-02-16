Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # HOST sign_up/home/email_address/new
  # form/shirt_names/new
  # form/shirt_names

  # form/ages/new
  # form/ages
  namespace :fan do
    resources :shirt_numbers, only: %i[new create]
    resources :shoe_sizes, only: %i[new create]
    resources :weights, only: %i[new create]
    resources :birth_cities, only: %i[new create]
  end
end


##
