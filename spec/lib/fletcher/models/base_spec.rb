require 'spec_helper'

describe Fletcher::Model::Base do
  describe "generate" do     
  end
  
  describe "new" do
    it "should create properly" do 
    end     
  end

  describe "parse_price" do 
    it "should return a price float and currency" do
      model = Factory.build(:sample)
      model.parse_price(model.raw_price)
      model.price.is_a?(Money).should == true
      model.price.currency.should_not be_nil
    end
  end
end  
