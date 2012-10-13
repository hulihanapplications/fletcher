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
    url "http://www.amazon.com/gp/product/B004HZYA6E/"
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

  factory :googleshopping, :parent => :base do
    url "http://www.google.com/products/catalog?hl=en&q=xbox+360&um=1&ie=UTF-8&tbm=shop&cid=6970582693578667145&sa=X&ei=-UAuUOi7G4P80QX8hYHwDA"
  end
  
  factory :gamecouk, :parent => :base do
    url "http://www.game.co.uk/en/rise-of-nightmares-kinect-compatible-93535"
  end
  
  factory :playcom, :parent => :base do
    url "http://www.play.com/DVD/DVD/4-/14805648/-/Product.html"
  end
end