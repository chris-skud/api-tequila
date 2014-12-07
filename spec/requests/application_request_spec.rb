require 'rails_helper'
require 'json_request_helper'

RSpec.describe 'Application' do

  context 'when invalid url requested' do

    it 'returns a 404' do
      get '/invalid'
      expect(response.code).to eq '404'

      # something weird is occurring with ActiveModel serializer that prevents a reasonable json response.
      expect(response.body).to eq 'Page not found'
    end
  end
end
