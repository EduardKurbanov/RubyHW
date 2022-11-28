Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "api/v1/articles#index_all"
  namespace :api do
    namespace :v1 do
      resources :authors, only: [:index, :create] do
        resources :articles, only: [:index, :show, :create, :update, :destroy] do
          resources :comments, only: [:index, :create, :update, :destroy]
        end
      end
    end
  end
end
