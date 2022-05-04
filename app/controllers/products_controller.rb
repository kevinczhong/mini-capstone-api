class ProductsController < ApplicationController
  def all_products
    render json: { products: Product.all }
  end

  def water_bottle
    render json: { product: Product.find_by(name: "Water Bottle") }
  end

  def backpack
    render json: { product: Product.find_by(name: "Backpack") }
  end

  def hiking_shoes
    render json: { product: Product.find_by(name: "Hiking shoes") }
  end
end