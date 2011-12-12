require 'spec_helper'

describe Fletcher::Item::Ebay do
  describe "parse" do     
    context "with valid data" do
      it "should return correct item info" do 
        item = described_class.new
        item.parse Fletcher::Data.read(Factory(:ebay_item).url)    
        item.name.should_not be_nil
        puts item.image.inspect
        item.image.should_not be_nil        
      end       
    end
  end
end  
