Rails.application.routes.draw do
  resources :bloggers, only: [:new, :create, :show]
  resources :destinations, only: :show
  resources :posts

  get '', to: 'posts#index'
end
