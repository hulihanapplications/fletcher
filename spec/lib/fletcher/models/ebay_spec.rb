require 'spec_helper'

describe Fletcher::Model::Ebay do
  describe "parse" do     
    context "with valid data" do
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
