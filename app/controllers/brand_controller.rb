class BrandController < ApplicationController

  def index
    @brands = Brand.all
    render json: @brands, root: :brands, each_serializer: BrandSerializer
  end

  def show
    brand = Brand.find_by(id: params[:id])

    if brand
      render json: brand
    else
      not_found
    end
  end

  def create
    brand = Brand.create(brand_params)
    render status: :created, json: brand
  end

  def update
    brand = Brand.find(params[:id])
    brand.update(brand_params)
    render status: :no_content, json: {}
  end

  def delete
    brand = Brand.find_by(id: params[:id])
    if brand
      brand.destroy
      render status: :no_content, json: {}
    else
      not_found
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
