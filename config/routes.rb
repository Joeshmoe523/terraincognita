Rails.application.routes.draw do
  devise_for :users

  # Pages routes
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # Existing routes...
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
