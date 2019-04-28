Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :checklists, except: %i[new] do
    resources :items, only: %i[create update destroy]
  end
end
