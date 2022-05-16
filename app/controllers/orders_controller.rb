class OrdersController < ApplicationController
  def index
    if current_user
      orders = User.find_by(id: current_user.id).orders
      render json: orders.as_json
    else
      render json: { errors: "You are not logged in!" }, status: :bad_request
    end
  end

  def show
    if current_user
      orders = User.find_by(id: current_user.id).orders
      order = orders.find_by(id: params["id"])
      render json: order.as_json
    else
      render json: { errors: "You are not logged in!" }, status: :bad_request
    end
  end

  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: Product.find_by(id: params["product_id"]).price,
      tax: Product.find_by(id: params["product_id"]).tax,
      total: Product.find_by(id: params["product_id"]).total,
    )
    if current_user
      order.save
      render json: order.as_json
    else
      render json: { errors: "You are not logged in!" }, status: :bad_request
    end
  end
end
