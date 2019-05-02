Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :checklists, except: %i[new] do
    resources :items, only: %i[create update destroy] do
      member do
        post :complete
        post :undo
      end
    end
  end
  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    member do
      post :create_checklist
    end
  end
end
