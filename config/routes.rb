Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :procedures
  resources :stages
  resources :documents
  # Serve websocket cable requests in-procedure
  # mount ActionCable.server => '/cable'
  root 'procedures#index'
end
