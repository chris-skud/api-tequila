require 'rubyXL'

class NomSpreadsheet
  def self.to_2d_array(spreadsheet)
    workbook = RubyXL::Parser.parse(spreadsheet)
    workbook.worksheets[0].extract_data
  end
end
