class ImagesController < ApplicationController
  def index
    @images = Image.all
    render :index
  end

  def show
    @image = Image.find_by(params[:id])
    render :show
  end

  def create
    @image = Image.create(
      url: params["url"],
      description: params["description"],
      product_id: params["product_id"]
    )
    if @image.valid?
      render :show
    else
      render json: { message: @image.errors.full_messages }
    end
  end

  def update
    @image = Image.find_by(params[:id])
    @image.update(
      url: params["url"],
      description: params["description"],
      product_id: params["product_id"]
    )
    if @image.valid?
      render :show
    else
      render json: { message: @image.errors.full_messages }
    end
  end
end
