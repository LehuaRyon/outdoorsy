Rails.application.routes.draw do
  resources :customers, only: [:index, :new, :create, :destroy] do
    collection { post :import }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
