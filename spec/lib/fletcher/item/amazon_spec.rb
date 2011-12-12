require 'spec_helper'

describe Fletcher::Item::Amazon do
  describe "parse" do     
    context "with valid data" do
      it "should return correct item info" do 
        item = described_class.new
        item.parse Fletcher::Data.read(Factory(:amazon_item).url)    
        item.name.should_not be_nil
        item.description.should_not be_nil
      end       
    end
  end
end  
