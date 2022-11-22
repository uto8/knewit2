Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :delivery_contents, only: [:index, :new] do
    collection do
      get 'search'
    end
    collection { post :import }
  end
  resources :loads, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :trucks, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :actual_vehicle_rates, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :loading_rates, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :mileages, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :date_mileages, only: [:index] do
    collection do
      get 'search'
    end
  end
  get 'drivers/index', to: 'drivers#index'
end
