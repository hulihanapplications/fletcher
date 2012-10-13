require 'spec_helper'

describe Fletcher, :vcr do
  context :models do 
    describe :identify_model, :vcr do
      it "should raise an error when using an unsupported domain" do 
        lambda{described_class.identify_model(Factory(:invalid).url)}.should raise_error 
      end

      for model in Fletcher.models
        it "should return #{model} sym when using a #{model} domain" do
          described_class.identify_model(Factory(model).url).should == model
        end 
      end   
    end 

    describe :fetch, :vcr do
      # for model in Fletcher.models
      #   it "should return valid data for #{model} model" do
      #     item = described_class.fetch(Factory(model).url)
      #     item.should_not be_nil
      #     item.name.should_not be_nil       
      #     item.description.should_not be_nil if model == :amazon
      #   end 
      # end   

      it "should fetch amazon product" do
        item = described_class.fetch(Factory(:amazon).url)
        item.should_not be_nil
        item.name.should_not be_nil       
        item.description.should_not be_nil 
      end

      # Disable ebay fetch test, since auctions always end
      # it "should fetch ebay product" do
      #   item = described_class.fetch(Factory(:ebay).url)
      #   item.should_not be_nil
      #   item.name.should_not be_nil       
      # end

      it "should fetch etsy product" do
        item = described_class.fetch(Factory(:etsy).url)
        item.should_not be_nil
        item.name.should_not be_nil       
        item.description.should_not be_nil 
      end

      it "should fetch gamecouk product" do
        item = described_class.fetch(Factory(:gamecouk).url)
        item.should_not be_nil
        item.name.should_not be_nil       
        item.description.should_not be_nil 
      end

      it "should fetch googleshopping product" do
        item = described_class.fetch(Factory(:googleshopping).url)
        item.should_not be_nil
        item.name.should_not be_nil       
        item.description.should_not be_nil
      end      

      it "should fetch playcom product" do
        item = described_class.fetch(Factory(:playcom).url)
        item.should_not be_nil
        item.name.should_not be_nil       
        item.description.should_not be_nil 
      end  

      it "should fetch thinkgeek product" do
        item = described_class.fetch(Factory(:thinkgeek).url)
        item.should_not be_nil
        item.name.should_not be_nil       
        item.description.should_not be_nil 
      end
    end    
  end
  
  describe :version do
    it "should return a string" do
      described_class.version.should_not be_nil
    end
  end

  describe :models do
    it "should return an array of models" do
      described_class.models.should_not be_nil
      # Test append
      described_class.models << :somemodel
      described_class.models.include?(:somemodel).should == true
    end 
  end
end  
