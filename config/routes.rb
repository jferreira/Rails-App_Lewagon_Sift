Rails.application.routes.draw do

  get 'article/index'
  get 'article/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :topics, only: [:index, :show ]
  resources :events, only: [:index, :show ]

end
