require "hashie"

Factory.define :base, :class => Fletcher::Model::Base  do |o|
  o.url "http://www.example.com"  
end

Factory.define :sample, :parent => :base  do |o|
  o.url "http://www.example.com"
  o.name "Sample Model"
  o.description "This is a sample description."
  o.raw_price "$5.00"   
end

Factory.define :invalid, :parent => :base do |o|
  o.url "http://invalid"
end  

Factory.define :valid, :parent => :base do |o|
  o.url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
  o.title_xpath "//h1[@class='parseasinTitle']"
  o.images_xpath "//table[@class='productImageGrid']//img"
end

Factory.define :amazon, :parent => :base do |o|
  o.url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
end

# This may need to be updated if the item is expired/deleted
Factory.define :ebay, :parent => :base do |o|
  o.url "http://www.ebay.com/itm/Franklin-Library-3V-ESSAYS-MONTAIGNE-Leather-Great-Books-1979-Donald-Frame-/190654183378"
end

Factory.define :thinkgeek, :parent => :base do |o|
  o.url "http://www.thinkgeek.com/geektoys/plush/e7f8/"
end

Factory.define :etsy, :parent => :base do |o|
  o.url "http://www.etsy.com/listing/78608690/farm-fresh-125-x-19-in-pick-your-color"
end