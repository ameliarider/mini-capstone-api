Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
end

# get "/products/necklaces" => "products#show_necklaces"
# get "/products/bracelets" => "products#show_bracelets"
# get "/products/earrings" => "products#show_earrings"
