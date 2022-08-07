Rails.application.routes.draw do
  resources :crews
  resources :concerts
  resources :bands

  root "bands#index"
end
