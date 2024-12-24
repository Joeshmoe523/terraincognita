Rails.application.routes.draw do
  get "dashboard/index"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :profiles, only: [ :index ]

  resources :growth_plans, param: :token do
    member do
      get "timeline"
      get "collaborators"
    end
  end

  resources :after_signup, only: [ :show, :update ]

  # Pages routes
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # Dashboard routes
  get "dashboard", to: "dashboard#index"

  # Existing routes...
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
