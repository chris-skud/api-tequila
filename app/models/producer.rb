class Producer < ActiveRecord::Base
  validates :name, presence: true
  validates :nom, presence: true

  has_many :brands
end
