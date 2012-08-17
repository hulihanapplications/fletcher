# encoding: utf-8
module Fletcher
  module Model
    class Playcom < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /play\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)

        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.xpath("//h1[@itemprop='name']").first_string
          
          self.description = doc.css('div.line div.unit div.tabs section#Description').to_s

          # Get Price
          raw_price = doc.css('div.product-overview div.line span.price').first_string
          parse_price(raw_price.gsub(/\302\243/,'')) if raw_price
          
          # Get Image
          self.image = doc.css('a#main_product img')[0][:src].to_s unless doc.css('a#main_product img').nil?
        end            
      end
    end
  end
end