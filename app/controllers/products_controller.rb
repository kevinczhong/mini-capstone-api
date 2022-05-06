hackclass ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.create(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
      # name: "Pants",
      # price: 20,
      # image_url: "placeholder",
      # description: "A pair of pants",
    )
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params["id"])
    # product.name = params["name"]
    # product.price = params["price"]
    # product.image_url = params["image_url"]
    # product.description = params["description"]
    product.update(
      name: params["name"] || product.name,
      price: params["price"] || product.price,
      image_url: params["image_url"] || product.image_url,
      description: params["description"] || product.description,
    )
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "This product has been removed from inventory." }
  end

  # def water_bottle
  #   render json: { product: Product.find_by(name: "Water Bottle") }
  # end

  # def backpack
  #   render json: { product: Product.find_by(name: "Backpack") }
  # end

  # def hiking_shoes
  #   render json: { product: Product.find_by(name: "Hiking shoes") }
  # end
end

#Independently specifying methods/paths for individual products seems completely untenable with scale. There has to be a way to automate this.
