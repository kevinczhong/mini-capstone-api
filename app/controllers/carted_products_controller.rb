class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(status: "carted")
    render template: "carted_products/index"
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
      order_id: nil,
    )
    carted_product.save
    render template: "carted_products/index"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params["id"])
    carted_product.update(
      status: "removed",
    )
    render json: { message: "This item has been removed from the cart" }
  end
end
