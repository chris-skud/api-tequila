require 'rails_helper'
require 'json_request_helper'

RSpec.describe 'Producers' do

  context 'when #index requested' do
    let(:producers) {json[:producers]}

    it 'returns producers collection' do
      producer = FactoryGirl.create(:producer)

      get '/producers'

      it_responds_with_code_200
      expect(producers.first[:name]).to eq producer.name
    end
  end
end
