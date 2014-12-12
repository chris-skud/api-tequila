namespace :nom do
  desc "import-convert-seed tequila nom data"
  task :seed => :environment do
    puts 'seeding nom'
    binding.pry

    puts 'fetching Nom file'
    spreadsheet = NomFetch.new.xlsx_file
    puts 'fetch complete'

    puts 'transforming to array'
    nom_2d_array = NomSpreadsheet.new(spreadsheet).to_2d_array
    puts 'transform complete'

    puts 'importing data'
    NomImporter.new.import(nom_2d_array)
    puts 'nom seed complete'
  end
end
