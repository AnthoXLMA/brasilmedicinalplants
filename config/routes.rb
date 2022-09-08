Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root to: "pages#home"
get "/contact" => "pages#contact"
get "/about" => "pages#about"

resources :plants, only:  [:index, :show]
resources :symptoms, only:  [:index, :show]
resources :tratamentos, only:  [:index, :show]
resources :tipos, only:  [:index, :show]
end
