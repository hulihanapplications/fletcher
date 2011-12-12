module Fletcher
  # This contains helper methods for Nokogiri interactions
  module Nokogiri
    module HTML
      module Document
        # Get a string from a CSS selector
        # 
        #   doc.css_gets("h1.title") # => "Some Title"
        #
        def css_gets(string)
          nodeset_gets(css(string))         
        end
        
        # Get a string from an XPATH selector     
        # 
        #   doc.xpath_gets("//meta[@name='description']/@content") # => "Some Description"
        #        
        def xpath_gets(string)
          nodeset_gets(xpath(string))                   
        end  
        
        # Extract a string from a Nokogiri nodeset
        def nodeset_gets(nodeset)  
          # Identify the type/class from the nodeset's first child, then extract a string from it 
          node = nodeset.first          
          case node
          # xml/html element?
          when ::Nokogiri::XML::Element 
            extracted_string = node.content.strip
          # xml/html attribute?
          when ::Nokogiri::XML::Attr
            extracted_string = node.value.strip
          # no node found
          else 
            extracted_string = nil
          end 
          return extracted_string          
        end
      end
    end
  end
end

::Nokogiri::HTML::Document.send(:include, ::Fletcher::Nokogiri::HTML::Document) 