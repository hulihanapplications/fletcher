require 'nokogiri'
require 'open-uri'

module Fletcher
  # This class is responsible for fetching and parsing data.
  class Data
    # Get read url and get data object
    def self.read(url)
      doc = Nokogiri::HTML(open(url))
    end 
  end
end