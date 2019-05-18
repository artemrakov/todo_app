Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :checklists do
    resources :items, only: %i[new create update destroy] do
      resource :item_resolutions, only: [:create, :destroy]
    end
  end

  namespace :checklist_templates do
    resource :user, only: :show
  end

  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    resource :checklist_copy, only: %i[create]
  end
end
