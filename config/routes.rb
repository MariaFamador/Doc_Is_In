DocIsIn::Application.routes.draw do

  devise_for :users
  resources :users
  resources :patients

  root 'dashboards#index'

end

