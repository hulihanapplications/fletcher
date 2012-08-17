require "hashie"
require "money"

module Fletcher
  module Model
    class Base < ::Hashie::Mash         
      # Create a product object based on service
      #   Fletcher::Model::Base.generate(:amazon, "<html>...") # => #<Fletcher::Model::Amazon:0x...> 
      def self.generate(service = nil, data = nil)
        case service
        when :amazon
          model = Fletcher::Model::Amazon.new
        when :ebay
          model = Fletcher::Model::Ebay.new
        when :thinkgeek
          model = Fletcher::Model::Thinkgeek.new
        when :etsy
          model = Fletcher::Model::Etsy.new
        when :googleshopping
          model = Fletcher::Model::Googleshopping.new
        end
        
        model.parse(data)
        return model 
      end

      # Parse data and set object attributes    
      def parse(data)
        self.doc = data # save data for if user wants to access it later      
      end      
      
      # Parse a raw price string to get usable data
      #   model.parse_price("$5.00") # => #<Money cents:500 currency:USD>
      #   model.price.to_f # => 5.0
      #   model.price.currency.symbol # => '$'
      def parse_price(raw_price = nil)
        return if raw_price.nil?
        self.price = ::Money.parse(raw_price)
      end
    end # Base
  end # Model
end # Fletcher