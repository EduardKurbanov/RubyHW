Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root "api/v1/articles#index_all"
  namespace :api do
    namespace :v1 do
      resources :authors, only: %i[index create destroy]
      resources :articles, only: %i[index show create update destroy] do
        get :update_status, on: :member
        resources :likes, only: %i[create destroy]
      end
      resources :comments, only: %i[index create update destroy] do
        get :update_status, on: :member 
        resources :likes, only: %i[create destroy]
      end
      resources :tags, only: %i[index show create update destroy]
    end
  end
end
