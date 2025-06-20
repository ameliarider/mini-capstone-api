class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render json: @orders
  end

  def create
    product = Product.find(params[:product_id])
    subtotal = product.price*params[:quantity].to_i
    tax = subtotal * 0.08
    total = subtotal + tax
    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if @order.save
      render json: @order, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    if @order
      render json: @order
    else
      render json: { message: "Not your order" }, status: :bad_request
    end
  end
end
