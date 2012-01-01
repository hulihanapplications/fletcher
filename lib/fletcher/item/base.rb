require "hashie"
require "money"

module Fletcher
  module Item
    class Base < ::Hashie::Mash         
      # Create a product object based on service
      #   Fletcher::Item::Base.generate(:amazon, "<html>...") # => #<Fletcher::Item::Amazon:0x...> 
      def self.generate(service = nil, data = nil)
        case service
        when :amazon
          item = Fletcher::Item::Amazon.new
        when :ebay
          item = Fletcher::Item::Ebay.new
        when :thinkgeek
          item = Fletcher::Item::Thinkgeek.new
        when :etsy
          item = Fletcher::Item::Etsy.new
        end
        
        item.parse(data)
        return item 
      end

      # Parse data and set object attributes    
      def parse(data)
        self.doc = data # save data for if user wants to access it later      
      end      
      
      # Parse a raw price string to get usable data
      #   item.parse_price("$5.00") # => #<Money cents:500 currency:USD>
      #   item.price.to_f # => 5.0
      #   item.price.currency.symbol # => '$'
      def parse_price(raw_price = nil)
        return if raw_price.nil?
        self.price = ::Money.parse(raw_price)
      end
    end # Base
  end # Item
end # Fletcher