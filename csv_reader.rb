# frozen_string_literal: true

# CSVReader class to read the csv file and initialize the csv data
class CSVReader
  attr_reader :csv_data

  def initialize(file_path = 'info.csv')
    @csv_data = CSV.read(file_path)
  end
end
