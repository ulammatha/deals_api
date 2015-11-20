Rails.application.routes.draw do
  root to: 'vendors#index'
  resources :vendors, only: [:index, :show, :create, :update, :destroy]
end
