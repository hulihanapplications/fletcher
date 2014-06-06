module Fletcher
  module Model
    class Newegg < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /newegg\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        case doc
        when Nokogiri::HTML::Document
          # Get Name          
          self.name = doc.css("#synopsis .grpDesc .wrapper h1 > span").first_string
          #self.name = doc.css("#synopsis .grpDesc .wrapper > .span").first_string

          # Description - Not always reliable.
          self.description = doc.css(".itmDesc > p").first_string

          # Get Price (currently disabled because price is displayed after page load)
          #parse_price doc.css("li.price-current").attribute("content").content
                          
          # # Get Images
          self.images = [{:src => doc.css('.mainSlide > img').attribute("src").content}]
          self.image = images.first
        end
      rescue
        return nil
      end
    end
  end
end