Rails.application.routes.draw do
  get 'wikis' => 'wikis#index'

  resources :wikis

  devise_for :users, controllers: {sessions: 'users/sessions'}
  get 'welcome/index'

  get 'welcome/about'

  root 'wikis#index'
end
