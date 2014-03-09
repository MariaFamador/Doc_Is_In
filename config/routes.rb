DocIsIn::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users

  resources :patients do
    post :search, on: :collection
    resources :medical_histories, on: :member
  end

  resources :appointments do
    patch :cancel, on: :member
  end

  resources :prescriptions
  resources :medicines do
    post :search, on: :collection
    get :cabinet, on: :collection
  end

  get 'dashboards/', to: 'dashboards#index'
  get 'calendar/', to: 'appointments#calendar'
end
