class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find(params["id"])
    render :show
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
    )

    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def update
    @product = Product.find(params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      supplier_id: params["supplier_id"]
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def destroy
    @product = Product.find(params["id"])
    @product.destroy

    render json: { message: "Product deleted" }
  end
end
