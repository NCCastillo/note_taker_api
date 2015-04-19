Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :conferences, only: [:index, :show]
      resources :presenters, only:[:index, :show]
      resources :events, only: [:index, :show]
      namespace :users do
        resources :notes, only: [:index, :show, :create]
      end
    end
  end
end
