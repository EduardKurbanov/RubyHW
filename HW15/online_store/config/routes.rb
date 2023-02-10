require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate :admin_user do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: %i[show index update]
  resources :categories, only: %i[show index]
  resources :line_items, only: %i[create destroy update]
  resources :orders, only: %i[create show index new update]

  get "/about", to: redirect("/about.html")
  get "/faqs", to: redirect("/faqs.html")

  root 'products#index', as: "home"

  get "/cart", to: "carts#show", as: "cart"

  #match '*unmatched', to: 'application#notfound!', via: :all
  #match "*path", to: "application#notfound!", via: :all
end
