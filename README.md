# Fletcher 

Fletcher is a cross-website product/item information fetcher. Give fletcher a product url and you'll get back a nice, simple object that's easy to work with.

## Features 

* Uses nokogiri for data parsing
* No third-party API Access Required (Good for websites that don't even have API access) 

## Supported Websites

* [Amazon](http://www.amazon.com) (name, description, images)
* [eBay](http://www.ebay.com) (name, images)
* [ThinkGeek](http://www.thinkgeek.com) (name, description, images)
* [Etsy](http://www.etsy.com) (name, description, images)

## Installation

```bash
gem install fletcher
```

## Examples

```ruby
item = Fletcher.fetch "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"

item.name # => "Avenir Deluxe Unicycle (20-Inch Wheel)"

item.description # => "A wonderful unicycle"

item.image # => {:url => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg", :alt => "Picture of Unicycle"}

item.image.url # => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg"


# Get Raw Nokogiri Document
item.doc.class.name # => Nokogiri::HTML::Document
```

## Attributes

The following attributes are available from items:

* title - (String) The name of the item/product
* description - (String) The item/product description
* image - (Hash) The main image of the item
* images - (Array) Any available images of the item

