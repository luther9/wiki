Rails.application.routes.draw do
  get 'users/show'

  get 'wikis' => 'wikis#index'

  resources :wikis

  devise_for :users, controllers: {sessions: 'users/sessions'}
  resources(:users, only: [:show]) {
    put '/downgrade' => 'users#downgrade', as: :downgrade
  }

  get 'welcome/index'

  get 'welcome/about'

  root 'wikis#index'

  resources :charges, only: [:new, :create]

  resources :collaborators, only: [:create, :destroy]
end
