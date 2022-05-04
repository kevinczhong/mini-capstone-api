Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products", controller: "products", action: "index"
  get "/products/:id", controller: "products", action: "show"
  post "/products", controller: "products", action: "create"
  # get "/water_bottle", controller: "products", action: "water_bottle"
  # get "/backpack", controller: "products", action: "backpack"
  # get "/hiking_shoes", controller: "products", action: "hiking_shoes"
end
