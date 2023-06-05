Rails.application.routes.draw do
  devise_for :users
  root :to => redirect('users')

  resources :users, only: [:index, :show]
  resources :groups, only: [:index, :show, :new, :create] do
    resources :entities, only: [:index, :show, :new, :create]
  end
end
