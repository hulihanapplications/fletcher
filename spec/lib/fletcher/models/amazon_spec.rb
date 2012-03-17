require 'spec_helper'

describe Fletcher::Model::Amazon do
  describe "parse" do     
    context "with valid data" do
      it "should return correct model info" do 
        model = described_class.new
        model.parse Fletcher::Data.read(Factory(:amazon_model).url)    
        model.name.should_not be_nil
        model.description.should_not be_nil
        model.price.should_not be_nil        
        model.image.should_not be_nil        
      end       
    end
  end
end  
