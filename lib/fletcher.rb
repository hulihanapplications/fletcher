# = Fletcher
# Author:: Dave Hulihan - 2011  
require "uri"
require "fletcher/data"
require "fletcher/string"
require "fletcher/nokogiri"

module Fletcher  
  class << self
    # Detect model by url
    #   Fletcher.identify_model("http://www.amazon.com/whatever") => :amazon
    def identify_model(url)
      if url =~ ::URI::regexp
        uri = ::URI::parse(url)
        host = uri.host
        if host =~ Fletcher::Model::Amazon.regexp
          model = :amazon
        elsif host =~ Fletcher::Model::Ebay.regexp
          model = :ebay        
        elsif host =~ Fletcher::Model::Thinkgeek.regexp
          model = :thinkgeek
        elsif host =~ Fletcher::Model::Etsy.regexp
          model = :etsy
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

    # Create mattrs
    attr_accessor :models
  end
  
  # Initialize models mattr & Load models array from dir
  @models = Array.new 
  Dir[File.join(File.dirname(__FILE__), "fletcher", "models", "*.rb")].each do |f|
    model = File.basename(f, ".rb").to_sym
    @models << model unless model == :base
  end 

  # Load Models/Models
  module Model
    # Dir[File.join(dir, "*.rb")].each do |f|
    #   autoload f      
    # end 
    autoload :Base, 'fletcher/models/base'
    for model in Fletcher.models
      autoload model.to_s.capitalize.to_sym, "fletcher/models/#{model}"
    end
  end 
end