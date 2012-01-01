module Fletcher
  module Item
    class Thinkgeek < Fletcher::Item::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /thinkgeek\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        # Store raw document object 
        self.doc = data 
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.xpath("//meta[@property='og:title']/@content").first_string
          
          # Get Description
          self.description = doc.xpath("//meta[@property='og:description']/@content").first_string
  
          # Get Price
          parse_price(doc.xpath("//form[@id='buy']/h3").first_string)
          
          # Get Images
          self.images = [{:url => doc.xpath("//meta[@property='og:image']/@content").first_string}] 
          self.image = images.first
        end            
      end
    end
  end
end