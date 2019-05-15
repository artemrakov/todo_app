Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :checklists, except: %i[new create] do
    resources :items, only: %i[create update destroy]
  end

  resources :items, only: [] do
    resource :item_resolutions, only: [:create, :destroy]
  end

  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    resource :checklists, only: :create
  end
end
