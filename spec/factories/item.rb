require "hashie"

Factory.define :item, :class => Fletcher::Item::Base  do |o|
  o.url "http://www.example.com"  
end

Factory.define :sample_item, :parent => :item  do |o|
  o.url "http://www.example.com"
  o.name "Sample Item"
  o.description "This is a sample description."
  o.raw_price "$5.00"   
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

Factory.define :thinkgeek_item, :parent => :item do |o|
  o.url "http://www.thinkgeek.com/geektoys/plush/e7f8/"
end

Factory.define :etsy_item, :parent => :item do |o|
  o.url "http://www.etsy.com/listing/78608690/farm-fresh-125-x-19-in-pick-your-color"
end