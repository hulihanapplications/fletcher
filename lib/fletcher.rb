# = Fletcher
# Author:: Dave Hulihan - 2011  
require "uri"
require "fletcher/data"
require "fletcher/string"
require "fletcher/nokogiri"

module Fletcher
  #autoload :Data, 'fletcher/data'
  #autoload :Nokogiri, 'fletcher/nokogiri'
  
  module Item
    dir = 'fletcher/item'
    Dir[File.join(dir, "*.rb")].each do |f|
       #autoload f      
    end 
    autoload :Base, 'fletcher/item/base'
    autoload :Amazon, 'fletcher/item/amazon'
    autoload :Ebay, 'fletcher/item/ebay'
    autoload :Thinkgeek, 'fletcher/item/thinkgeek'
    autoload :Etsy, 'fletcher/item/etsy'
  end 
  
  # Detect service by url
  #   Fletcher.identify_service("http://www.amazon.com/whatever") => :amazon
  def self.identify_service(url)
    if url =~ ::URI::regexp
      uri = ::URI::parse(url)
      host = uri.host
      if host =~ Fletcher::Item::Amazon.regexp
        service = :amazon
      elsif host =~ Fletcher::Item::Ebay.regexp
        service = :ebay        
      elsif host =~ Fletcher::Item::Thinkgeek.regexp
        service = :thinkgeek
      elsif host =~ Fletcher::Item::Etsy.regexp
        service = :etsy
      else 
        service = :unknown 
        raise ArgumentError, "Fletcher doesn't support #{host} yet."
      end
    else 
      raise ArgumentError, "not a url"
    end
  end
  
  # Fetch information based on url
  def self.fetch(url) 
    service = identify_service(url)
    data = Fletcher::Data.read(url)
    item = Fletcher::Item::Base.generate(service, data)
    # Store url
    item.url = url
    
    item.parse(data)
    return item   
  end  
  
  # Get gem version
  def self.version
    File.read(File.join(root, "VERSION"))
  end
  
  # Get gem root directory
  def self.root
    File.expand_path("../..", __FILE__)
  end
end