# Fletcher

[![Build Status](https://travis-ci.org/hulihanapplications/fletcher.png)](http://travis-ci.org/hulihanapplications/fletcher)
 
Fletcher is a cross-website product information fetcher. Just give fletcher a product's url and you'll get back a nice, uniform object that's easy to work with.

## Features 

* No third-party API access required (good for websites that don't even have API access) 
* Uses nokogiri for data parsing

## Supported Websites

* [Amazon](http://www.amazon.com) 
* [eBay](http://www.ebay.com)
* [Etsy](http://www.etsy.com) 
* [game.co.uk](http://www.game.co.uk)
* [Google Shopping](http://www.google.com/products/)
* [Newegg](http://www.newegg.com)
* [play.com](http://www.play.com)
* [Steam](http://store.steampowered.com)
* [ThinkGeek](http://www.thinkgeek.com)

## Installation

```bash
gem install fletcher
```

## Usage

### API

```ruby
require "fletcher"

product  = Fletcher.fetch "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"

product.name # => "Avenir Deluxe Unicycle (20-Inch Wheel)"

product.description # => "A wonderful unicycle"

product.images.count # => 1
product.image # => {:src => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg", :alt => "Picture of Unicycle"}
product.image.src # => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg"

product.price # => #<Money cents:500 currency:USD>
product.price.to_f # => 5.0
product.price.format # => "$5.00"  
product.price.currency.symbol # => "$"

# Get Raw Nokogiri Document
product.doc.class.name # => Nokogiri::HTML::Document

# Get list of supported websites/services
Fletcher.models # => [:amazon, :ebay, :etsy, :thinkgeek, ...]
```

### CLI

Get Product Details (defaults to yaml output):

```sh
$ fletcher fetch "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"

---
name: Avenir Deluxe Unicycle (20-Inch Wheel)
description: 'Amazon.com: Avenir Deluxe Unicycle (20-Inch Wheel): Sports & Outdoors'
price: $99.99
image:
  src: http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA280_.jpg
url: http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8
```

Get a single attribute of a product:

```sh
$ fletcher fetch --only name "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"
Avenir Deluxe Unicycle (20-Inch Wheel)
```

Get list of supported websites:

```sh
$ fletcher websites
Amazon
ThinkGeek
...
```

## Attributes

The following attributes/method are available for a product:

* `name` - (String) The name of the product
* `description` - (String) The product's description
* `price` - (Money) A [Money](https://github.com/RubyMoney/money) object representing the product's price. This makes converting exchange rates and math functionality easy to use.
* `image` - (Hash) The main image of the product, if available. This is a hash containing standard HTML attributes: `src`, `alt`, `width`, `height`, etc.
* `images` - (Array) An array of product images.
* `doc` - The raw `Nokogiri::HTML::Document` object for the product. You can use this to pull other stuff from the product's page.


## Contributing

If you make any changes to fletcher, be sure to run the test suite before creating any pull requests.

	bundle install
	bundle exec rspec spec/

* Troubleshooting

	* fletcher uses [vcr](https://github.com/vcr/vcr) to save http requests for faster testing. To pull real-time http data, clear the vcr cache with `rm -rf spec/vcr`.