module Fletcher
  module Item
    class Amazon < Fletcher::Item::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /amazon\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        self.doc = data # save raw document object 
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.css_gets("h1.parseasinTitle") 
          # Get Description
          self.description = doc.css_gets("div#productDescriptionWrapper")           
          self.description = doc.xpath_gets("//meta[@name='description']/@content") if description.nil? # get description from meta title
        end            
      end
    end
  end
end