class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    product = Product.find(params["id"])
    render json: product
  end

  def create
    product = Product.create(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
    )
    render json: product
  end

  def update
    product = Product.find(params["id"])
    product.update(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
    )
    render json: product
  end

  def destroy
  end

  # def show_necklaces
  #   products = Product.where(name: "necklace")
  #   render json: products
  # end

  # def show_bracelets
  #   products = Product.where(name: "bracelet")
  #   render json: products
  # end

  # def show_earrings
  #   products = Product.where(name: "earrings")
  #   render json: products
  # end

  # def show_gold_jewelry
  #   products = Product.where(description: "gold")
  #   render json: products
  # end
end
