module Fletcher
  module Item
    class Amazon < Fletcher::Item::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /amazon\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        self.doc = data # save raw nokogiri doc 
        if data.is_a?(Nokogiri::HTML::Document)
          self.name = data.css("h1.parseasinTitle").first.content.strip
          self.description = nil 
        end            
      end
    end
  end
end