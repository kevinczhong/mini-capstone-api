class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers.as_json
  end

  def show
    supplier = Supplier.find_by(id: params[:id])
    render json: supplier.as_json
  end

  def create
    supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    render json: supplier.as_json
  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.update(
      name: params[:name] || supplier.name,
      email: params[:email] || supplier.email,
      phone_number: params[:phone_number] || supplier.phone_number,
    )
    supplier.save
    render json: supplier.as_json
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.destroy
    render json: { message: "This entry has been destroyed" }
  end
end
