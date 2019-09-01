Rails.application.routes.draw do
  resources :conversions
  root to: 'conversions#index'
end
