# Fletcher 

Fletcher is a cross-website product/item information fetcher. Give fletcher a product url and you'll get back a nice, standardized object that's easy to work with.

## Features 

* Uses nokogiri for data parsing
* No third-party API Access Required (Good for websites that don't even have API access) 

## Supported Websites

* "Amazon":http://www.amazon.com (name, description, image)
* "eBay":http://www.ebay.com (name, image)

## Installation

```bash
gem install fletcher
```

## Examples

```ruby
product = Fletcher.fetch "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"

product.name # => "Avenir Deluxe Unicycle (20-Inch Wheel)"

product.description # => "A wonderful unicycle"

product.images # => [{:url => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg", :alt => "Avenir Deluxe Unicycle (20-Inch Wheel)"}]

# Get Raw Nokogiri Document
product.doc # => Nokogiri::HTML::Document
```

## Attributes

The following attributes are available from items:

* title - (String) The name of the item/product
* description - (String) The item/product description
* images - (Array) Any available images of the item

