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
end
