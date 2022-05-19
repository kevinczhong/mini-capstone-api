class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = User.find_by(id: current_user.id).orders
    render template: "orders/index"
    # render json: orders.as_json
  end

  def show
    orders = User.find_by(id: current_user.id).orders
    @order = orders.find_by(id: params["id"])
    render template: "orders/show"
    # render json: order.as_json
  end

  def create
    carted_products = CartedProduct.where(status: "carted")
    subtotal = 0
    tax = 0
    total = 0
    for carted_product in carted_products
      product = Product.find_by(id: carted_product[:product_id])
      subtotal += product.price * carted_product[:quantity]
      tax += product.tax * carted_product[:quantity]
      total += subtotal + tax
    end
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    order.save
    for carted_product in carted_products
      carted_product.update(
        status: "purchased",
        order_id: order.id,
      )
    end
    render json: order.as_json

    # product = Product.find_by(id: params["product_id"])
    # pp product.price.class
    # pp params["quantity"].class
    # calc_subtotal = product.price * params["quantity"].to_i
    # calc_tax = product.tax * params["quantity"].to_i
    # calc_total = product.total * params["quantity"].to_i
    # order = Order.new(
    #   user_id: current_user.id,
    #   product_id: params["product_id"],
    #   quantity: params["quantity"],
    #   subtotal: calc_subtotal,
    #   tax: calc_tax,
    #   total: calc_total,
    # )
    # order.save
    # render json: order.as_json
  end
end
