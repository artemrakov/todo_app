Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :checklists, except: %i[new create] do
    resources :items, only: %i[create update destroy]
  end

  namespace :checklist_templates do
    resource :user, only: :show
  end

  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    resource :checklists, only: :create
  end
end
