require 'rails_helper'

describe Brand do
  describe 'Attributes' do
    it {should have_attribute :name}
  end

  describe 'Validations' do
    # it {should validate_presence_of :first_name}
  end

  describe 'Associations' do
    it {should belong_to :producer}
    it {should have_many :products}
  end
end
