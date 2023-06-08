Rails.application.routes.draw do
  devise_for :users
  root :to => redirect('categories')

  resources :users, only: [:index, :show]
  resources :groups, path: 'categories', only: [:index, :show, :new, :create] do
    resources :entities, path: 'transactions', only: [:index, :show, :new, :create]
  end
end
