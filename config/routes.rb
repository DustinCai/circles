Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :circles
  resources :events

  authenticated :user do
    root 'users#dashboard'
  end

  root 'static_pages#home'
end
