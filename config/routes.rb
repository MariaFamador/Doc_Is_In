DocIsIn::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  unauthenticated :user do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  authenticate :user do
    resources :accounts do
      resources :users
      resources :accounts

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
  end
end
