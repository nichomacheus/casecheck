Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :hospitals, defaults: { format: 'json' }
  resources :users, defaults: { format: 'json' }


end
