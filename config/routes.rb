Rails.application.routes.draw do
  get 'users/show'

  get 'wikis' => 'wikis#index'

  resources :wikis

  devise_for :users, controllers: {sessions: 'users/sessions'}
  resources :users, only: [:show]

  get 'welcome/index'

  get 'welcome/about'

  root 'wikis#index'

  resources :charges, only: [:new, :create]
end
