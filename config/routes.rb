Rails.application.routes.draw do
  root 'customers#index'
  resources :customers, only: [:index, :new, :create, :destroy] do
    collection { post :import }
  end
end
