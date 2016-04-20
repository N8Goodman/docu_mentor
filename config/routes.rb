Rails.application.routes.draw do
  devise_for :users

  resources :procedures do
    resources :levels, only: [:create, :delete]
  end

  resources :levels do
    resources :orders do
      collection do
        post 'upmove'
        post 'downmove'
      end
    end
  end

  resources :stages do
    resources :materials, only: [:create, :delete]
  end

  resources :apps do
    resources :steps
    resources :uploads
  end

  resources :documents
  # Serve websocket cable requests in-procedure
  # mount ActionCable.server => '/cable'
  root 'apps#index'
end
