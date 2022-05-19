Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products", controller: "products", action: "index"
  get "/products/:id", controller: "products", action: "show"
  post "/products", controller: "products", action: "create"
  patch "/products/:id", controller: "products", action: "update"
  delete "/products/:id", controller: "products", action: "destroy"

  get "/suppliers", controller: "suppliers", action: "index"
  get "/suppliers/:id", controller: "suppliers", action: "show"
  post "/suppliers", controller: "suppliers", action: "create"
  patch "/suppliers/:id", controller: "suppliers", action: "update"
  delete "/suppliers/:id", controller: "suppliers", action: "destroy"
  # get "/water_bottle", controller: "products", action: "water_bottle"
  # get "/backpack", controller: "products", action: "backpack"
  # get "/hiking_shoes", controller: "products", action: "hiking_shoes"
  get "/images", controller: "images", action: "index"
  get "/images/:id", controller: "images", action: "show"
  post "/images", controller: "images", action: "create"
  patch "/images/:id", controller: "images", action: "update"
  delete "/images/:id", controller: "images", action: "destroy"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/orders", controller: "orders", action: "index"
  get "/orders/:id", controller: "orders", action: "show"
  post "/orders", controller: "orders", action: "create"

  get "carted_products", controller: "carted_products", action: "index"
  post "/carted_products", controller: "carted_products", action: "create"
  delete "/carted_products/:id", controller: "carted_products", action: "destroy"
end
