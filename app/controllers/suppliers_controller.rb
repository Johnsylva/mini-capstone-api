class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all

    render :index

  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],

    )

    if @supplier.save
      render :show, status: :created
    else
      render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end
end

