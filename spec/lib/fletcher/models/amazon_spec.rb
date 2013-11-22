require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    it "should fetch amazon product" do
      item = described_class.fetch(FactoryGirl.build(:amazon).url)
      item.should_not be_nil
      item.name.should_not be_nil       
      item.description.should_not be_nil 
    end   
  end 
end 

def amazon_check(url)
  model = described_class.new
  model.parse Fletcher::Data.read(url)    
  model.name.empty?.should_not == true
  model.description.should_not be_nil
  model.price.should_not be_nil        
  model.image.should_not be_nil       
end

describe Fletcher::Model::Amazon do
  describe "parse", :vcr do
    context "with valid data" do
      it "should return correct model info for an in-house product (kindle)" do 
        amazon_check(FactoryGirl.build(:amazon).url)
      end 
    end
  end
end  
