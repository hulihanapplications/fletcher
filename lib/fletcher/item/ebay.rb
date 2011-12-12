module Fletcher
  module Item
    class Ebay < Fletcher::Item::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /ebay\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        # Store raw document object 
        self.doc = data 
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.xpath_gets("//h1[@itemprop='name']")
        end            
      end
    end
  end
end