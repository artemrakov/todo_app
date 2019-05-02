Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :checklists, except: %i[new] do
    resources :items, only: %i[create update destroy] do
      post :create, controller: :item_resolve
      delete :destroy, controller: :item_resolve
    end
  end
  resources :checklist_templates do
    resources :template_items, only: %i[create update destroy]
    member do
      post :create_checklist
    end
  end
end
