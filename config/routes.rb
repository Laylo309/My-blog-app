Rails.application.routes.draw do
  resources :users, only: [:index, :show] do resources :posts, only: [:index, :show, :new] end

    resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
    end
root 'users#index'
end
