require "hashie"

Factory.define :item, :class => Hashie::Mash  do |o|
  o.url "http://www.example.com"  
end

Factory.define :invalid_item, :parent => :item do |o|
end  

Factory.define :valid_item, :parent => :item do |o|
  o.url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
  o.title_xpath "//h1[@class='parseasinTitle']"
  o.images_xpath "//table[@class='productImageGrid']//img"
end

Factory.define :amazon_item, :parent => :item do |o|
  o.url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
end

Factory.define :ebay_item, :parent => :item do |o|
  o.url "http://www.ebay.com/itm/24-Wheel-Leakproof-Butyl-Tire-Adjustable-Unicycle-Free-Stand-Cycling-Bike-Green-/370564417915"
end

