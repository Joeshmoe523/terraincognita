Rails.application.routes.draw do
  get "user_profiles/edit"
  get "user_profiles/update"
  get "dashboard/index"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :profiles, only: [ :index ]

  resources :user_profiles, param: :token, only: [ :edit, :update ]
  resources :role_profiles, param: :token, only: [ :new, :create, :show, :edit, :update ]

  resources :growth_plans, param: :token do
    member do
      get "timeline"
      get "collaborators"
    end
  end

  resources :feedback_items, param: :token, only: [ :new, :create, :show, :edit, :update ]
  resources :progress_updates, param: :token, only: [ :new, :create, :show, :edit, :update ]

  resources :after_signup, only: [ :show, :update, :create ]

  # Pages routes
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # Dashboard routes
  get "dashboard", to: "dashboard#index"

  # Existing routes...
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
