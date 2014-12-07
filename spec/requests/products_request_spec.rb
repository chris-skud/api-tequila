require 'rails_helper'
require 'json_request_helper'

RSpec.describe 'Products' do

  context 'when #index requested' do
    let(:products) {json[:products]}

    it 'returns products collection' do
      product = FactoryGirl.create(:product)

      get '/products'

      it_responds_with_code_200
      expect(products.first[:name]).to eq product.name
    end
  end
end
