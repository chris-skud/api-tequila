require 'rails_helper'
require 'json_request_helper'

RSpec.describe 'Brands' do

  context 'when #index requested' do
    let(:brands) {json[:brands]}

    it 'returns brands collection' do
      brand = FactoryGirl.create(:brand)

      get '/brands'

      it_responds_with_code_200
      expect(brands.first[:name]).to eq brand.name
    end
  end

  describe '#show' do
    context 'when valid request' do
      it 'returns brand' do
        brands = FactoryGirl.create_list(:brand, 3)

        get "/brands/#{brands[2].id}"
        it_responds_with_code_200
        expect(json[:brand][:name]).to eq brands[2].name
      end
    end

    context 'when invalid request' do
      it 'returns 404 not found' do

        get "/brands/1"

        expect(response.code).to eq '404'
      end
    end
  end

  describe '#create' do
    it 'returns brands collection' do

      post '/brands', :brand => {name: 'Brand 1'}

      expect(response.code).to eq '201'
      expect(json[:brand][:name]).to eq 'Brand 1'
    end
  end

  describe '#patch' do
    it 'updates a brand' do
      brand = FactoryGirl.create(:brand)
      patch "brands/#{brand.id}", brand: {name: 'Updated Brand'}

      updated_brand = Brand.find(brand.id)

      expect(response.code).to eq '204'
      expect(updated_brand[:name]).to eq 'Updated Brand'
    end
  end

  describe '#delete' do
    context 'when valid brand id' do
      it 'deletes a brand' do
        brand = FactoryGirl.create(:brand)
        delete "brands/#{brand.id}"

        deleted_brand = Brand.find_by(brand.id)

        expect(response.code).to eq '204'
        expect(deleted_brand).to be_nil
      end
    end

    context 'when invalid brand id' do
      it 'returns a 404' do
        delete "brands/99"
        expect(response.code).to eq '404'
      end
    end
  end
end
