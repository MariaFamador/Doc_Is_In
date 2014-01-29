DocIsIn::Application.routes.draw do
  devise_for :users
  resources :users
  resources :patients do
    post :search, on: :collection
    resources :medical_histories
  end

  resources :appointments
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/dashboards/', to: 'dashboards#index'
end
