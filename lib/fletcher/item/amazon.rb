module Fletcher
  module Item
    class Amazon < Fletcher::Item::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /amazon\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        # Store raw document object 
        self.doc = data 
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.css_gets("h1.parseasinTitle")
           
          # Get Description
          self.description = doc.css_gets("div#productDescriptionWrapper")     
                
          # Get description from meta title if not found
          self.description = doc.xpath_gets("//meta[@name='description']/@content") if description.nil?
          
          # Get Image
          self.images = doc.xpath_get("//table[@class='productImageGrid']//img/@src", :attr_array) #parse_images() # get images
          
          #self.image = doc.xpath_gets("//table[@class='productImageGrid']//img/@src")
        end            
      end
    end
  end
end