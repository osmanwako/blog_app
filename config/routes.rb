Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#start"
  # Defines the root path route ("/")
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:index]
    end
  end

  namespace :api do
    namespace :v1 do
      get "comments/index"
      get "comments/create"
      get "posts/index"
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end
end
