Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  patch '/posts/:id/add_likes', to: 'posts#add_likes' #add patch route under this route.
  resources :destinations

end
