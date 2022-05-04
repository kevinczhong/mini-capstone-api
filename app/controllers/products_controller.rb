class ProductsController < ApplicationController
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
    )
    render json: product.as_json
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
