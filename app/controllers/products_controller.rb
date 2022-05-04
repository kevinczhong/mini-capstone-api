class ProductsController < ApplicationController
  def all_products
    render json: { products: Product.all }
  end
end
