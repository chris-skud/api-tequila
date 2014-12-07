class ProductController < ApplicationController

  def index
    @products = Product.all
    render json: @products, root: :products, each_serializer: ProductSerializer
  end
end
