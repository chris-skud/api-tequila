def json
  JSON.parse(response.body, symbolize_names: true)
end

def it_responds_with_code_200
  expect(response.code).to eq '200'
end
