Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "invoices#index"


  resources :clients
  resources :products
  resources :invoices
  resources :selections
end
