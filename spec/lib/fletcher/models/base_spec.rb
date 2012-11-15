require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    context "when using an unsupported website" do 
      it "should return meta title as name" do
        item = described_class.fetch(FactoryGirl.build(:unsupported).url)
        item.name.should_not be_nil
      end 
    end
  end
end 

describe Fletcher::Model::Base do
  describe "generate" do     
  end
  
  describe "new" do
    it "should create properly" do 
    end     
  end

  describe "parse_price", :vcr do 
    it "should return a price float and currency" do
      model = FactoryGirl.build(:sample)
      model.parse_price(model.raw_price)
      model.price.is_a?(Money).should == true
      model.price.currency.should_not be_nil
    end
  end
end  
