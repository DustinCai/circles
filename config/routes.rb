Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    member do
      post 'leave_circle'
    end
  end

  resources :circles do
    collection do
      get 'search'
    end
    resources :events, only: [:create, :destroy, :update]
  end

  resources :events

  authenticated :user do
    root 'users#dashboard'
  end

  root 'static_pages#home'
end
