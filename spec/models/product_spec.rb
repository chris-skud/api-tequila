require 'rails_helper'

describe Product do
  describe 'Attributes' do
    it {should have_attribute :name}
    it {should have_attribute :style}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Associations' do
    it {should belong_to :brand}
  end
end
