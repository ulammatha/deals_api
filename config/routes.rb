Rails.application.routes.draw do
  root to:  'api/v1/vendors#index'

  scope module: 'api', defaults: { format: :json } do
    namespace :v1 do
      resources :vendors, only: [:index, :show, :create, :update, :destroy]
      resources :restaurants, only: [:index, :show, :create, :update, :destroy]
      resources :deals, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
