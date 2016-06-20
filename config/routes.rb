Rails.application.routes.draw do
  get 'wikis' => 'wikis#index'

  get 'wikis/new'

  get 'wikis/show'

  get 'wikis/edit'

  get 'wikis/destroy'

  devise_for :users, controllers: {sessions: 'users/sessions'}
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
