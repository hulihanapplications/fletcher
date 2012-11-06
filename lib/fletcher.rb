# = Fletcher
# Author:: Dave Hulihan - 2012
require "uri"

require File.expand_path("fletcher/data", File.dirname(__FILE__))
require File.expand_path("fletcher/string", File.dirname(__FILE__))
require File.expand_path("fletcher/nokogiri", File.dirname(__FILE__))

module Fletcher  
  # Module Methods
  class << self
    # Detect model by url
    #   Fletcher.identify_model("http://www.amazon.com/whatever") # => :amazon
    def identify_model(url)
      if url =~ ::URI::regexp
        uri = ::URI::parse(url)
        host = uri.host
        if host =~ Fletcher::Model::Amazon.regexp
          model = :amazon
        elsif host =~ Fletcher::Model::Ebay.regexp
          model = :ebay        
        elsif host =~ Fletcher::Model::Etsy.regexp
          model = :etsy          
        elsif host =~ Fletcher::Model::Gamecouk.regexp
          model = :gamecouk
        elsif host =~ Fletcher::Model::Googleshopping.regexp
          model = :googleshopping          
        elsif host =~ Fletcher::Model::Playcom.regexp
          model = :playcom
        elsif host =~ Fletcher::Model::Thinkgeek.regexp          
          model = :thinkgeek
        elsif host =~ Fletcher::Model::Steam.regexp          
          model = :steam
        else 
          model = :unknown 
          raise ArgumentError, "Fletcher doesn't support #{host} yet."
        end
      else 
        raise ArgumentError, "not a url"
      end
    end
    
    # Fetch information based on url
    def fetch(url) 
      model = identify_model(url)
      data = Fletcher::Data.read(url)
      model = Fletcher::Model::Base.generate(model, data)
      # Store url
      model.url = url
      
      model.parse(data)
      return model   
    end  
    
    # Get gem version
    def version
      File.read(File.join(root, "VERSION"))
    end
    
    # Get gem root directory
    def root
      File.expand_path("../..", __FILE__)
    end

    def models
      models = Array.new
      Dir[File.join(File.dirname(__FILE__), "fletcher", "models", "*.rb")].each do |f|
        model = File.basename(f, ".rb").to_sym
        models << model unless model == :base
      end 
      return models
    end 
  end

  LIBRARY_PATH       = File.join(File.dirname(__FILE__), 'fletcher')
  CLI_PATH           = File.join(LIBRARY_PATH, 'cli')
  MODEL_PATH         = File.join(LIBRARY_PATH, 'models')

  # Autoload CLI
  module CLI
    autoload :Utility, File.join(CLI_PATH, 'utility')
  end

  # Autoload Models
  module Model
    autoload :Base, File.join(MODEL_PATH, "base")
    for model in Fletcher.models
      autoload model.to_s.capitalize.to_sym, File.join(MODEL_PATH, model.to_s)
    end
  end     
end