require 'spec_helper'

describe Fletcher::Item::Base do
  describe "generate" do     
  end
  
  describe "new" do
    it "should create properly" do 
    end     
  end

  describe "parse_price" do 
    it "should return a price float and currency" do
      item = Factory.build(:sample_item)
      item.parse_price(item.raw_price)
      item.price.is_a?(Money).should == true
      item.price.currency.should_not be_nil
    end
  end
end  
