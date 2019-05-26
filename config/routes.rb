Rails.application.routes.draw do
   devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :checklists do
    resources :items, only: %i[new update destroy] do
      resource :item_resolutions, only: [:create, :destroy]
    end
  end

  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    resource :checklist_copy, only: %i[create]
  end

  resources :users do
    resources :checklist_templates, module: 'users', only: %i[index show]
  end
end
