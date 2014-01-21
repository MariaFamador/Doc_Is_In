DocIsIn::Application.routes.draw do

  devise_for :users
  resources :users
  resources :patients do
    post :search, on: :collection
  end

  resources :appointments
  root 'dashboards#index'
end
