require 'nokogiri'
require 'open-uri'

module Fletcher
  # This class is responsible for fetching and parsing data.
  class Data
    # Get read url and get data object
    def self.read(url, agent = nil)
      user_agent = agent.blank? ? Fletcher::USER_AGENT : agent
      response = open(url, "User-Agent" => user_agent)
      doc = ::Nokogiri::HTML(response.read)

      # Save contents of URL/Remote File for debugging
      # response.rewind
      # last_response_file = File.expand_path(File.join("..", "..", "last_response"), File.dirname(__FILE__))
      # File.new(last_response_file, "w+").write(response.read)
      return doc
    end
  end
end
