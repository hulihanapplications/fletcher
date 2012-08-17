module Fletcher
  module Model
    class Googleshopping < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /google\.com\/products/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.css('h1#product-name span.main-title').first_string

          # Get Description
          self.description = doc.css("div.product-desc-cont div.product-desc").first_string   

          # Get Price
          parse_price( doc.css('div#product-details span.product-price span.main-price').first_string )
                          
          # Get Images
          self.images = doc.css('div#product-basic-info img').attribute_array
          self.image = images.first
        end            
      end
    end
  end
end