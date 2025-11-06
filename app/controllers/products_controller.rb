class ProductsController < ApplicationController
  def show
    @product = Product.find(params["id"])

    render template: "products/show"
  end

  def index
    @products = Product.all

    render template: "products/index"
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image_url: params[:image_url]

    )

    render template: "products/show"
  end

  def update
    @product = Product.find(params[:id])

    @product.update(
      name: params[:name] || @product.name,
      description: params[:description] || @product.description,
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url
    )

    render :show
  end

  def destroy
    @product = Product.find(params[:id])
    
    @product.destroy

    render json: {message: "Product deleted..."}
  end


end

