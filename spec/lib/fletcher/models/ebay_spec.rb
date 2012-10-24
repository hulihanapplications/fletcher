require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    # Force use of ebay cassette since auctions always end
    it "should fetch ebay product", :vcr => { :cassette_name => "ebay_fetch" } do
      item = described_class.fetch(Factory(:ebay).url)
      item.should_not be_nil
      item.name.should_not be_nil       
    end   
  end 
end 

describe Fletcher::Model::Ebay, :vcr => { :cassette_name => "ebay_model" }  do
  describe "parse" do     
    context "with valid data" do
      # Diable Realtime Test, too inconsistent
      it "should return correct model info" do 
        model = described_class.new
        model.parse Fletcher::Data.read(Factory(:ebay).url)
        model.name.should_not be_nil
        model.price.should_not be_nil        
        model.image.should_not be_nil        
      end       
    end
  end
end  
