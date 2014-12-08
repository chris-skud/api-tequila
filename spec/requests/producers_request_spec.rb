require 'rails_helper'
require 'json_request_helper'

RSpec.describe 'Producers' do

  describe '#index' do
    let(:producers) {json[:producers]}

    it 'returns producers collection' do
      producer = FactoryGirl.create(:producer)

      get '/producers'

      it_responds_with_code_200
      expect(producers.first[:name]).to eq producer.name
    end
  end

  describe '#show' do
    context 'when valid request' do
      it 'returns producers collection' do
        producer = FactoryGirl.create(:producer)

        get "/producers/#{producer.id}"

        it_responds_with_code_200
        expect(producer[:name]).to eq producer.name
      end
    end

    context 'when invalid request' do
      it 'returns 404 not found' do

        get "/producers/1"

        expect(response.code).to eq '404'
      end
    end
  end

  describe '#create' do
    context 'when request contains all params' do
      it 'returns producers collection' do

        post '/producers', :producer => {name: 'Producer 1', nom: 1234, dot: 123, address: 'Mexico', telephone: '9999999'}

        expect(response.code).to eq '201'
        expect(json[:producer][:nom]).to eq 1234
        end
    end

    context 'when request contains some params' do
      it 'returns producers collection' do

        post '/producers', :producer => {name: 'Producer 2', nom: 9876}

        expect(response.code).to eq '201'
        expect(json[:producer][:nom]).to eq 9876
      end
    end
  end
end
