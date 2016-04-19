Rails.application.routes.draw do
  devise_for :users

    resources :procedures do
      resources :levels, only: [:create, :delete]
    end
    resources :stages do
      resources :materials, only: [:create, :delete]
    end
    resources :documents
    resources :apps
  # Serve websocket cable requests in-procedure
  # mount ActionCable.server => '/cable'
  root 'apps#index'
end
