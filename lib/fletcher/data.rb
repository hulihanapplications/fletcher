require 'nokogiri'
require 'open-uri'

module Fletcher
  # This class is responsible for fetching and parsing data.
  class Data
    # Get read url and get data object
    def self.read(url)
      remote_file = open(url)
      doc = ::Nokogiri::HTML(remote_file)
      
      # Save contents of URL/Remote File
      #last_url_file = File.expand_path(File.join("..", "..", "remote_file"), File.dirname(__FILE__))        
      #File.new(last_url_file, "w+").write(remote_file.read)
    end 
  end
end