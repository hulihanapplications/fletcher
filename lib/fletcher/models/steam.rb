module Fletcher
  module Model
    class Steam < Fletcher::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /store\.steampowered\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.css('#main_content .apphub_AppName').first_string
          
          unless self.name
            self.name = doc.xpath("string(//title)") 
            self.name.slice!(" on Steam")
          end

          # Get Description
          self.description = doc.css("div#main_content div#game_area_description").first_string   

          # Get Price
          parse_price( doc.css('div.leftcol.game_description_column div.game_purchase_price.price').first_string )
                          
          # Get Images
          self.images = doc.css('div.screenshot_holder > a').collect do |node| 
            {:src => node.attribute("href").value}
          end 

          # Get Image from Age Check
          self.images = doc.xpath("//div[@id='agegate_box']//img").attribute_array if self.images.empty?

          self.image = images.first
        end
      end
    end
  end
end