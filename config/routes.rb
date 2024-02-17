Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # HOST sign_up/home/email_address/new
  # form/shirt_names/new
  # form/shirt_names

  # form/ages/new
  # form/ages
  namespace :fan do
    resources :shirt_numbers, only: %i[new create]
    resources :shoe_sizes, only: %i[new create]
    resources :number_of_children, only: %i[new create]
    resources :heights, only: %i[new create]
    resources :weights, only: %i[new create]
    resources :birth_cities, only: %i[new create]
    resources :incomes, only: %i[new create]
    resources :favorite_foods, only: %i[new create]
    resources :favorite_drinks, only: %i[new create]
    resources :preferred_looks, only: %i[new create]
    resources :favorite_videogames, only: %i[new create]
    resources :sport_interests, only: %i[new create]
    resources :merch_interests, only: %i[new create]
    resources :preferred_channels, only: %i[new create]
    resources :membership_durations, only: %i[new create]
    get 'shirt_numbers', to: 'shirt_numbers#search', as: :shirt_number_search
    get 'heights', to: 'heights#search', as: :height_search
    get 'idolo', to: 'matches#show', as: :idol_match
  end
end
