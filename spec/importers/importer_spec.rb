require 'rails_helper'
require 'webmock/rspec'

describe 'NomRequest' do
  it 'Retrieves xlsx file' do
    url = 'http://www.crt.org.mx/images/marcascertificadasdetequila04112014.xlsx'
    stub_request(:any, url).
      to_return(:body => File.open(Tempfile.new('test_file'), 'r'), :status => 200)

    file = NomFetch.new.xlsx_file url
    expect(file).to be_a StringIO
  end
end

describe 'NomSpreadsheet' do
  it 'should convert xlsx to array' do
    file = File.open(File.join(Rails.root, 'spec/importers/tequila.xlsx'), 'r')
    nom_arr = NomSpreadsheet.new(file).to_2d_array
    expect(nom_arr).to be_a Array
  end
end

describe 'NomImporter' do
  let(:import_array) {
    [
      nil,
      ["Empresa", "Dirección", "NOM", "DOT", "Marca"],
      ["AGAVEROS DE MICHOACÁN , S.P.R. DE R.L.", "BLVD. LOPEZ MATEOS55 COL.CENTRO C.P.59300. LA PIEDAD, MICHOACAN DE OCAMPO Tel:013285187310", 1569, 286, "TEQUIMICH"],
      ["AGAVEROS UNIDOS DE AMATITAN, S.A. DE C.V.", "RANCHO MIRAVALLES/N COL.RANCHO MIRAVALLE C.P.45380. AMATITAN, JALISCO Tel:013747450526", 1426, 141, "DON TEPO"],
      [nil, nil, nil, nil, "AZUÑIA"],
      [nil, nil, nil, nil, "DIVA MAYA"],
      [nil, nil, nil, nil, "MIRAVALLE"],
      [nil, nil, nil, nil, "REY MOMO"],
    ]
  }

  before do
    NomImporter.new.import(import_array)
  end

  it 'creates producer record from array' do
    expect(Producer.find_by(name: 'AGAVEROS UNIDOS DE AMATITAN, S.A. DE C.V.').nom).to eq 1426
  end

  it 'creates a brand record' do
    expect(Brand.find_by(name: 'DIVA MAYA')).not_to be_nil
  end

  it 'associates brand with prodcuer' do
    expect(Brand.find_by(name: 'DIVA MAYA').producer.name).to eq 'AGAVEROS UNIDOS DE AMATITAN, S.A. DE C.V.'
  end
end
