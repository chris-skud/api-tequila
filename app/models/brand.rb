class Brand < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :producer
  has_many :products
end
