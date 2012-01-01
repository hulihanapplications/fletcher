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
          self.name = doc.xpath("//h1[@itemprop='name']").first_string
          
          # Get Description
          # OMITTED: This is tough to get because ebay item descriptions are custom html/content created by sellers

          # Get Price
          parse_price(doc.xpath("//span[@itemprop='price']").first_string.gsub(/US/, ""))
          
          # Get Image
          self.images = [{:url => doc.xpath("//span[@itemprop='image']/img").first_string}]
          self.image = images.first
        end            
      end
    end
  end
end