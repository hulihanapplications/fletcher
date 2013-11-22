module Fletcher
  module Model
    class Etsy < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /etsy\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.xpath("//span[@itemprop='name']").first_string

          # Get Description
          self.description = doc.xpath("//div[@id='description-text']").first_string

          # Get Price
          parse_price(doc.xpath("//meta[@itemprop='price']/@content").first_string)
                          
          # Get Images
          self.images = doc.xpath("//div[@id='image-main']//img").attribute_array 
          self.image = images.first
        end            
      end
    end
  end
end