# = Fletcher
# Author:: Dave Hulihan - 2012
require "uri"

require File.expand_path("fletcher/data", File.dirname(__FILE__))
require File.expand_path("fletcher/model", File.dirname(__FILE__))
require File.expand_path("fletcher/string", File.dirname(__FILE__))
require File.expand_path("fletcher/nokogiri", File.dirname(__FILE__))

module Fletcher  
  LIBRARY_PATH       = File.join(File.dirname(__FILE__), 'fletcher')
  CLI_PATH           = File.join(LIBRARY_PATH, 'cli')
  MODEL_PATH         = File.join(LIBRARY_PATH, 'models')
  # User Agent (Chrome)
  USER_AGENT         = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36"  

  # Module Methods
  class << self    
    # Fetch information based on url
    def fetch(url) 
      # Look for model based on url
      model_class = Fletcher::Model.identify(url)

      # Use Base class for fallback
      model_class = Fletcher::Model::Base unless model_class
      
      data = Fletcher::Data.read(url)

      product = model_class.new
      product.parse(data)

      # Save url
      product.url = url
      
      return product
    end
    
    # Get gem version
    def version
      File.read(File.join(root, "VERSION"))
    end
    
    # Get gem root directory
    def root
      File.expand_path("../..", __FILE__)
    end

    # get array of models syms
    def models
      models = Array.new
      Dir[File.join(File.dirname(__FILE__), "fletcher", "models", "*.rb")].each do |f|
        model = File.basename(f, ".rb").to_sym
        models << model unless model == :base
      end 
      return models
    end 

    # get array of model classes
    #   Fletcher.model_classes = [Amazon, Ebay, ThinkGeek]
    def model_classes
      models = Array.new
      Dir[File.join(File.dirname(__FILE__), "fletcher", "models", "*.rb")].each do |f|
        filename = File.basename(f, ".rb")
        models << ["Fletcher", "Model", filename.camelize].join("::").constantize unless filename == "base"
      end 
      return models
    end 
  end



  # Autoload CLI
  module CLI
    autoload :Utility, File.join(CLI_PATH, 'utility')
  end

  # Autoload Models
  module Model
    autoload :Base, File.join(MODEL_PATH, "base")
    for model in Fletcher.models
      autoload model.to_s.camelize.to_sym, File.join(MODEL_PATH, model.to_s)
    end
  end     
end