Rails.application.routes.draw do
  resources :concerts
  resources :bands

  root "bands#index"
end
