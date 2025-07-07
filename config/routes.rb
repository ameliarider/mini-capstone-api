Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"
  get "/images" => "images#index"
  get "/images/:id" => "images#show"
  post "/images" => "images#create"
  get "/categories" => "categories#index"

  get "/cart" => "carted_products#index"
  post "/cart" => "carted_products#create"
  patch "/cart/:id" => "carted_products#destroy"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"
  delete "/orders/:id" => "orders#destroy"

  get "/users" => "users#index"
  post "/signup" => "users#create"

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
