DocIsIn::Application.routes.draw do

  devise_for :users
  resources :users
  resources :patients do
    get :book_appointment, on: :member
  end
  resources :appointments

  root 'dashboards#index'
  
end

