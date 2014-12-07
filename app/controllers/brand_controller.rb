class BrandController < ApplicationController

  def index
    @brands = Brand.all
    render json: @brands, root: :brands, each_serializer: BrandSerializer

  end
end
