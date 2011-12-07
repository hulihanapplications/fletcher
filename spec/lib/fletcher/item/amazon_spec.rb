require 'spec_helper'

describe Fletcher::Item::Amazon do
  describe "parse" do 
    
    context "with valid data" do
      it "should save the item's name" do 
        item = described_class.new
        item.parse Fletcher::Data.read(Factory(:amazon_item).url)    
        item.x = "1"
        puts item.inspect
        item.name.should_not be_nil
      end       
    end
  end
end  
