module Fletcher
  module Model
    class Gamecouk < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /game\.co\.uk/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)

        case doc
        when Nokogiri::HTML::Document
          require 'date'
          # Get Name
          self.name = doc.xpath("//meta[@property='og:title']/@content").first_string
          
          # Get Description
          # OMITTED: This is tough to get because ebay item descriptions are custom html/content created by sellers
          
          self.description = doc.css('div#primary div#details.panel div.description').to_s
          
          self.release_date = doc.css('div#primary div#details.panel p.releaseDate').first_string
          
          self.release_date = Date.strptime(self.release_date.gsub('Released on ',''), '%d-%b-%Y') if self.release_date
          
          # Get Price
          raw_price = doc.css("ul#variants ul.mint li.price").first_string
          Money.default_currency = Money::Currency.new("GBP")
          parse_price(raw_price.gsub(/Only /, "")) if raw_price
          
          # Get Image
          self.images = [{:url => doc.xpath("//meta[@property='og:image']/@content").first_string}]
          self.image = images.first
        end            
      end
    end
  end
end