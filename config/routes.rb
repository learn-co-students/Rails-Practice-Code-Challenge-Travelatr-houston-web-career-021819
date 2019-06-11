Rails.application.routes.draw do
  resources :bloggers, only: [:new, :create, :show]
  resources :posts, only: [:new, :create, :show, :edit, :update]
  resources :destinations, only: [:index, :show]

  post "/posts/:id/like", to: 'posts#like'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
