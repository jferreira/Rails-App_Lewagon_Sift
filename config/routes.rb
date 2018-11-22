Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :topics, only: [:index, :show ]
  resources :events, only: [:index, :show ]

  resources :articles, only: [:index, :show ] do
    resources :user_scores, only: [:create ]
    resources :save_articles, only: [:create, :destroy]
  end

  resources :profile, only: [:edit, :update, :show ]
  resources :following_items, only: [:create]

  # resources :map, only: [:index ]
  get '/map', to: 'maps#map'

end
