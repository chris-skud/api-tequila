namespace :nom do
  desc "import-convert-seed tequila nom data"
  task :seed do
    puts 'seeding nom'
    spreadsheet = NomRequest.xlsx_file
    nom_2d_array = NomSpreadsheet.to_2d_array(spreadsheet)
    NomImporter.import(nom_2d_array)
    puts 'nom seed complete'
  end
end
