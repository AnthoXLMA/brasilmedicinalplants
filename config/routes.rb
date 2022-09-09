Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get "/contact" => "pages#contact"
  get "/about" => "pages#about"
  get "/plants/download_pdf"
  # get 'users/trial_signup', to: 'users#trial_signup'
  # post 'users/trial_signup_submit', to: 'users#trial_signup_submit'

  resources :plants, only: [:index, :show] do
    resources :plantcards, only: [:show]
  end
  resources :symptoms, only: [:index, :show]
  resources :tratamentos, only: [:index, :show]
  resources :tipos, only: [:index, :show]
end
