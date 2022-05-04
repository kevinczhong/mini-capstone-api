class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products.as_json
  end

  def product
    product = Product.find_by(id: params["id"])
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
