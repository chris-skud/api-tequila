class ProducerSerializer < ActiveModel::Serializer
  attributes :name, :nom, :dot, :address, :telephone, :url
  has_many :brands

  def url
    "#{producers_path}/#{@object.id}"
  end
end
