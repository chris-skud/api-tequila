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

  describe '#show' do
    context 'when valid request' do
      it 'returns product' do
        products = FactoryGirl.create_list(:product, 3)

        get "/products/#{products[2].id}"
        it_responds_with_code_200
        expect(json[:product][:name]).to eq products[2].name
      end
    end

    context 'when invalid request' do
      it 'returns 404 not found' do

        get "/products/1"

        expect(response.code).to eq '404'
      end
    end
  end

  describe '#create' do
    it 'returns products collection' do

      post '/products', :product => {name: 'Product 1'}

      expect(response.code).to eq '201'
      expect(json[:product][:name]).to eq 'Product 1'
    end
  end

  describe '#patch' do
    it 'updates a product' do
      product = FactoryGirl.create(:product)
      patch "products/#{product.id}", product: {name: 'Updated Product'}

      updated_product = Product.find(product.id)

      expect(response.code).to eq '204'
      expect(updated_product[:name]).to eq 'Updated Product'
    end
  end

  describe '#delete' do
    context 'when valid product id' do
      it 'deletes a product' do
        product = FactoryGirl.create(:product)
        delete "products/#{product.id}"

        deleted_product = Product.find_by(product.id)

        expect(response.code).to eq '204'
        expect(deleted_product).to be_nil
      end
    end

    context 'when invalid product id' do
      it 'returns a 404' do
        delete "products/99"
        expect(response.code).to eq '404'
      end
    end
  end
end
