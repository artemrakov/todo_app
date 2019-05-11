Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :checklists do
    resources :items, only: %i[new create update destroy]
  end

  namespace :checklist_templates do
    resource :search, only: :show
  end

  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    resource :copy_checklist, only: %i[create]
  end

  # Item states
  post 'item_states/create/:id', to: 'item_states#create', as: :item_complete
  delete 'item_states/destroy/:id', to: 'item_states#destroy', as: :item_undo
end
