require 'rubyXL'

class NomSpreadsheet
  def initialize(spreadsheet)
    @spreadsheet = spreadsheet
  end

  def to_2d_array
    workbook = RubyXL::Parser.parse(@spreadsheet)
    workbook.worksheets[0].extract_data
  end
end
