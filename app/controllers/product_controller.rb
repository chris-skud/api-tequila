class ProductController < ApplicationController

  def index
    @products = Product.all
    render json: @products, root: :products, each_serializer: ProductSerializer
  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: product
    else
      not_found
    end
  end

  def create
    product = Product.create(product_params)
    render status: :created, json: product
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    render status: :no_content, json: {}
  end

  def delete
    product = Product.find_by(id: params[:id])
    if product
      product.destroy
      render status: :no_content, json: {}
    else
      not_found
    end
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
