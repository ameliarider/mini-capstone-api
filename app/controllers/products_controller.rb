class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [ :index, :show ]

  def index
    @products = Product.all

    if params[:category]
      category = Product.find_by(name: params[:category])
      @products = category.products
    end
    render :index
  end

  def show
    @product = Product.find(id: params[:id])
    render :show
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
    )

    if @product.save
      render :show
    else
      puts "--------"
      puts @product.errors.full_messages
      puts "--------"
      render json: { errors: @product.errors.full_messages }
    end
  end

  def update
    @product = Product.find(params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      supplier_id: params["supplier_id"] || @product.supplier_id
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    render json: { message: "Product deleted" }
  end
end
