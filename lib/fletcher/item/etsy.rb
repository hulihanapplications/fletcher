module Fletcher
  module Item
    class Etsy < Fletcher::Item::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /etsy\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        # Store raw document object 
        self.doc = data 
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.xpath("//div[@id='item-title']/h1").first_string

          # Get Description
          self.description = doc.xpath("//div[@id='item-description']/div[@class='section-content']").first_string   

          # Get Price
          parse_price(doc.xpath("//div[@class='item-amount']").first_string)
                          
          # Get Images
          self.images = doc.xpath("//div[@id='item-main']//div[@id='fullimage_link1']//img").attribute_array 
          self.image = images.first
        end            
      end
    end
  end
end