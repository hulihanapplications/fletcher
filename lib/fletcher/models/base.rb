require "hashie"
require "money"

module Fletcher
  module Model
    class Base < ::Hashie::Mash         
      # Parse data and set object attributes    
      def parse(data)
        self.doc = data # save data for if user wants to access it later      

        # Get page title as name
        self.name = doc.css("head > title").first_string
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