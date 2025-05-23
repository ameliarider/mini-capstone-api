class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find(params[:id])
    render :show
  end

  def create
    @supplier = Supplier.create(
      name: params["name"],
      email: params["email"],
      phone: params["phone"])
    if @supplier.valid?
      render :show
    else
      render json: { message: @supplier.errors.full_messages }
    end
  end

  def update
    @supplier = Supplier.find(params["id"])
    @supplier.update(
      name: params["name"] || @supplier.name,
      email: params["email"] || @supplier.email,
      phone: params["phone"] || @supplier.phone)
    if @supplier.valid?
      render :show
    else
      render json: { message: @supplier.errors.full_messages }
    end
  end

  def destroy
    @supplier = Supplier.find(params["id"])
    @supplier.destroy
    render json: { message: "The supplier has been deleted" }
  end
end
