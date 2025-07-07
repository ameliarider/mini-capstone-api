class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    pp "----------------"
    pp carted_products
    pp "----------------"

    calculated_subtotal = 0

    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.08
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    carted_products.update_all(status: "purchased", order_id: @order.id)

    render :index
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    if @order
      render :show
    else
      render json: { message: "Not your order" }, status: :bad_request
    end
  end
end
