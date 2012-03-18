require "hashie"

FactoryGirl.define do
  factory :base, :class => Fletcher::Model::Base  do
    url "http://www.example.com"  
  end

  factory :sample, :parent => :base  do
    url "http://www.example.com"
    name "Sample Model"
    description "This is a sample description."
    raw_price "$5.00"   
  end

  factory :invalid, :parent => :base do
    url "http://invalid"
  end  

  factory :valid, :parent => :base do
    url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
    title_xpath "//h1[@class='parseasinTitle']"
    images_xpath "//table[@class='productImageGrid']//img"
  end

  factory :amazon, :parent => :base do
    url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
  end

  # This may need to be updated if the item is expired/deleted
  factory :ebay, :parent => :base do
    url "http://www.ebay.com/itm/Franklin-Library-3V-ESSAYS-MONTAIGNE-Leather-Great-Books-1979-Donald-Frame-/190654183378"
  end

  factory :thinkgeek, :parent => :base do
    url "http://www.thinkgeek.com/geektoys/plush/e7f8/"
  end

  factory :etsy, :parent => :base do
    url "http://www.etsy.com/listing/78608690/farm-fresh-125-x-19-in-pick-your-color"
  end
end