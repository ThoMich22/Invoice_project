Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    root :to => 'devise/registrations#new'
  end

  resources :clients
  resources :products
  resources :invoices
  resources :selections
end
