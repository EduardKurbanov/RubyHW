Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products
  resources :categories
  
  get "/about", to: redirect("/about.html")
  get "/faqs", to: redirect("/faqs.html")

  root 'products#index', as: "home"
end
