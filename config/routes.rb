Rails.application.routes.draw do
  root "home#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
  get "signup", to: "registrations#new"
  resources :passwords, param: :token

  resources :projects do
    resources :journals do
      get "export", to: "journals#export", on: :member
    end
    resources :objectives do
      get "latest_journal_objectives", to: "objectives#latest_journal_objectives", on: :collection
      patch "complete", to: "objectives#complete", on: :member
    end
  end
  resources :photos do
    patch "associate", to: "photos#associate", on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
