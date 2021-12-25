Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new]
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  namespace  :api, defaults: {format: :json} do
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
root 'users#index'
end
