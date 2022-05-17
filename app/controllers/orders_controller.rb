class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = User.find_by(id: current_user.id).orders
    render template: "orders/index"
  end

  def show
    orders = User.find_by(id: current_user.id).orders
    @order = orders.find_by(id: params["id"])
    render template: "orders/show"
  end

  def create
    product = Product.find_by(id: params["product_id"])
    pp product.price.class
    pp params["quantity"].class
    calc_subtotal = product.price * params["quantity"].to_i
    calc_tax = product.tax * params["quantity"].to_i
    calc_total = product.total * params["quantity"].to_i
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
    )
    order.save
    render json: order.as_json
  end
end
