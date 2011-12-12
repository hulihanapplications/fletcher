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
          node_gets(css(string))         
        end
        
        # Get a string from an XPATH selector     
        # 
        #   doc.xpath_gets("//meta[@name='description']/@content") # => "Some Description"
        #        
        def xpath_gets(string)
          node_gets(xpath(string))                   
        end  
        
        # Extract a string from an unknown Nokogiri node type/class
        def node_gets(node)                
          case node.first
          when ::Nokogiri::XML::Element # xml/html element?
            extracted_string = node.first.content.strip
          when ::Nokogiri::XML::Attr # xml/html attribute?
            extracted_string = node.first.value.strip
          else # no node found
            extracted_string = nil
          end 
          return extracted_string          
        end
      end
    end
  end
end

::Nokogiri::HTML::Document.send(:include, ::Fletcher::Nokogiri::HTML::Document) 