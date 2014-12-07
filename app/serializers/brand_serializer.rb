class BrandSerializer < ActiveModel::Serializer
  attributes :name, :url

  def url
    "#{brands_path}/#{@object.id}"
  end
end
