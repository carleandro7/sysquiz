Rails.application.routes.draw do
  devise_for :users

  # Login customizado para alunos
  get  "aluno/login",  to: "aluno_sessions#new",     as: :aluno_login
  post "aluno/login",  to: "aluno_sessions#create"
  delete "aluno/logout", to: "aluno_sessions#destroy", as: :aluno_logout

  namespace :admin do
    root to: "dashboard#index"
    resources :escolas
    resources :alunos
    resources :serieanos
    resources :provas
  end

  resources :users
  resources :alunos
  resources :provas
  resources :serieanos
  resources :escolas
  resources :instituicas

  root "alunos#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
