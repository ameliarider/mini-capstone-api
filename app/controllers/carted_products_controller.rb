class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      render :index
    else
      render json: { message: "You must be signed in" }, status: :unauthorized
    end
  end


  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )

    if @carted_product.save
      render :show
    else
      puts "--------"
      puts @carted_product.errors.full_messages
      puts "--------"
      render json: { errors: @carted_product.errors.full_messages }
    end
  end

  def destroy
    pp current_user.carted_products
    pp "-----------------------"
    @carted_product = current_user.carted_products.find_by(id: params[:id])

    @carted_product.update(status: "removed")

    render json: { message: "Product was removed from the cart" }
  end
end
