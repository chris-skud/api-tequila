require 'rails_helper'

describe Producer do
  describe 'Attributes' do
    it {should have_attribute :name}
    it {should have_attribute :nom}
    it {should have_attribute :dot}
    it {should have_attribute :address}
    it {should have_attribute :telephone}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Associations' do
    it {should have_many :brands}
  end
end
