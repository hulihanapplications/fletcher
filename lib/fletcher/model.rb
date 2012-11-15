module Fletcher  
  module Model
    class << self    
      # Detect model by url
      #   Fletcher::Model.identify("http://www.amazon.com/whatever") # => Flether::Models::Amazon
      def identify(url)
        if url =~ ::URI::regexp
          uri = ::URI::parse(url)
          host = uri.host
          matched_model_class = nil
          for model in Fletcher.models
            #model_class =            
            matched_model_class = model_class if host =~ model_class.regexp 
          end 
          # raise ArgumentError, "Fletcher doesn't support #{host} yet." unless matched_model_class
          return matched_model_class          
        else 
          raise ArgumentError, "not a url"
        end
      end
    end
  end
end