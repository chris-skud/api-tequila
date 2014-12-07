class ProductSerializer < ActiveModel::Serializer
  attributes :name, :style

  def url
    "#{products_path}/#{@object.id}"
  end
end
