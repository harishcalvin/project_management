# /home/harish/repos/ruby_rails/gn_project/config/routes.rb
Rails.application.routes.draw do
  resources :projects do
    resources :phases, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root 'projects#index'
end
