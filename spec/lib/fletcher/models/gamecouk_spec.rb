require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    it "should fetch gamecouk product" do
      item = described_class.fetch(FactoryGirl.build(:gamecouk).url)
      item.should_not be_nil
      item.name.should_not be_nil       
      item.description.should_not be_nil 
    end   
  end 
end 

describe Fletcher::Model::Gamecouk, :vcr do
  describe "parse" do     
    context "with valid data" do
      it "should return correct model info" do 
        model = described_class.new
        model.parse Fletcher::Data.read(FactoryGirl.build(:gamecouk).url)    
        model.name.should_not be_nil
        model.description.should_not be_nil
        model.price.should_not be_nil        
        model.price.currency.iso_code.should == 'GBP'
        model.image.should_not be_nil        
      end       
    end
  end
end  