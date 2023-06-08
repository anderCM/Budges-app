Rails.application.routes.draw do
  devise_for :users
  #root :to => redirect('categories')

  resources :splash, only: [:index]
  resources :groups, path: 'categories', only: [:index, :show, :new, :create] do
    resources :entities, path: 'transactions', only: [:index, :show, :new, :create]
  end
  root 'splash#index'
end
