DocIsIn::Application.routes.draw do

  devise_for :users
  resources :users
  resources :patients
  resources :appointments

  root 'dashboards#index'
  
end

