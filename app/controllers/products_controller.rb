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
    @product = Product.new(product_params.except(:image, :image_description))

    if @product.save
      if product_params[:image].present?
        @image = @product.images.build(description: product_params[:image_description])
        @image.image.attach(product_params[:image])
        unless @image.save
          render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity and return
        end
      end

      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
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

  private
  def product_params
    params.permit(:name, :price, :description, :supplier_id, :image, :image_description)
  end
end
