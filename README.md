# Fletcher
[![Build Status](http://travis-ci.org/hulihanapplications/fletcher.png)](http://travis-ci.org/hulihanapplications/fletcher)
 

Fletcher is a cross-website product/model information fetcher. Give fletcher a product url and you'll get back a nice, simple object that's easy to work with.

## Features 

* Uses nokogiri for data parsing
* No third-party API Access Required (Good for websites that don't even have API access) 

## Supported Websites

* [Amazon](http://www.amazon.com) 
* [eBay](http://www.ebay.com)
* [Etsy](http://www.etsy.com) 
* [game.co.uk](http://www.game.co.uk)
* [Google Shopping](http://www.google.com/products/)
* [play.com](http://www.play.com)
* [ThinkGeek](http://www.thinkgeek.com)

## Installation

```bash
gem install fletcher
```

## Usage

```ruby
require "fletcher"

model = Fletcher.fetch "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"

model.name # => "Avenir Deluxe Unicycle (20-Inch Wheel)"

model.description # => "A wonderful unicycle"

model.image # => {:url => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg", :alt => "Picture of Unicycle"}

model.image.url # => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg"

model.price # => #<Money cents:500 currency:USD>
model.price.to_f # => 5.0
model.price.format # => "$5.00"  
model.price.currency.symbol # => "$"

# Get Raw Nokogiri Document
model.doc.class.name # => Nokogiri::HTML::Document

# Get list of supported websites/services
Fletcher.models # => [:amazon, :ebay, :etsy, :thinkgeek]
```

## Attributes

The following attributes are available from models:

* title - (String) The name of the model/product
* description - (String) The model/product description
* price - (Money) A [Money](https://github.com/RubyMoney/money) object representing the model price. This makes exchange rates and math functionality easy to use.
* image - (Hash) The main image of the model
* images - (Array) Any available images of the model

