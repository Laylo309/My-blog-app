Rails.application.routes.draw do
  get 'likes/likes'
  get 'comments/comments'
  resources :users, only: [:index, :show] do resources :posts, only: [:index, :show] end
root 'users#index'
end
