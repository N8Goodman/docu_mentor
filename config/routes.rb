Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :procedures
  # Serve websocket cable requests in-procedure
  # mount ActionCable.server => '/cable'
end
