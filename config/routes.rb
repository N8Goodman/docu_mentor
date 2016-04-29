Rails.application.routes.draw do
  devise_for :users

  resources :procedures do
    resources :levels, only: [:create]
  end

  resources :levels do
    collection do
      post 'update'
    end
  end

  resources :stages do
    resources :materials, only: [:create]
  end
  resources :materials, only: [:destroy]

  resources :apps do
    resources :steps
    resources :uploads
  end

  resources :documents
  # Serve websocket cable requests in-procedure
  # mount ActionCable.server => '/cable'
  root 'apps#index'
end
