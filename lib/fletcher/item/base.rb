require "hashie"

module Fletcher
  module Item
    class Base < ::Hashie::Mash         
      # Create a product object based on service
      #   Fletcher::Item::Base.generate(:amazon, "<html>...") # => #<Fletcher::Item::Amazon:0x...> 
      def self.generate(service = nil, data = nil)
        case service
        when :amazon
          return Fletcher::Item::Amazon.new(data)
        when :ebay
        end 
      end

      # Parse data and set object attributes    
      def parse(data)
        @doc = data # save data for if user wants to access it later      
      end      
    end # Base
  end # Product
end # Fletcher