Rails.application.routes.draw do
  get "dashboard/index"
  devise_for :users

  # Pages routes
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # Dashboard routes
  get "dashboard", to: "dashboard#index"

  # Existing routes...
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
