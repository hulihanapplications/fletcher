require "hashie"

Factory.define :item, :class => Hashie::Mash  do |o|
  o.url "http://www.example.com"  
end

Factory.define :invalid_item, :parent => :item do |o|
end  

Factory.define :valid_item, :parent => :item do |o|
  o.url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
end

Factory.define :amazon_item, :parent => :item do |o|
  o.url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
end
