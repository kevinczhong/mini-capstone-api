class ProductsController < ApplicationController
  def all_products
    render json: { products: Product.all }
  end

  def single_product
    render json:{product: }
end
