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
  #resources :line_items, onli: %i[create]
  resources :orders, onli: %i[create show index new]
  
  get "/about", to: redirect("/about.html")
  get "/faqs", to: redirect("/faqs.html")

  root 'products#index', as: "home"

  get "/cart", to: "carts#show", as: "cart"
  patch 'orders/:id/switch', to: 'orders#switch_status', as: 'switch'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => "line_items#destroy", as: "line_item"
  get 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  get 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'


  match '*unmatched', to: 'application#notfound!', via: :all
end
