Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get "/contact" => "pages#contact"
  get "/about" => "pages#about"
  get "/plantcards/:id/download_pdf", to: "plantcards#download_pdf", as: :plantcards

  resources :plants, only: [:index, :show]
  resources :plantcards, only: [:show, :download_pdf]
  resources :symptoms, only: [:index, :show]
  resources :tratamentos, only: [:index, :show]
  resources :tipos, only: [:index, :show]
end
