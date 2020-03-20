Rails.application.routes.draw do
  root to: 'pages#home'
  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:create]
    # new is going to be in the show page of my restaurant
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
