
  # Redireciona /aluno/login para o login padrão do Devise para alunos

  Rails.application.routes.draw do
    resources :provalunos
    # Redireciona /alunos/login para o login padrão do Devise para alunos
    get 'alunos/login', to: redirect('/alunos/sign_in')
  devise_for :alunos
  # Dashboard do aluno
  get 'aluno/dashboard', to: 'aluno_dashboard#index', as: :aluno_dashboard

  devise_for :users

  # Redireciona /users/login para o login padrão do Devise
  get 'users/login', to: redirect('/users/sign_in')

  # Rota do ranking da prova
  get 'provas/:id/ranking', to: 'prova_rankings#show', as: :prova_ranking



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
