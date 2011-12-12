require 'spec_helper'

describe Fletcher do
  describe :service do
    it "should raise an error when using an unsupported domain" do 
      lambda{described_class.identify_service(Factory(:item).url)}.should raise_error 
    end
    
    it "should return :amazon when using an amazon domain" do 
      described_class.identify_service(Factory(:amazon_item).url).should == :amazon
    end    
  end
  
  describe :fetch do 
    context :amazon do 
      it "should fetch amazon item info successfully" do 
        item = described_class.fetch(Factory(:amazon_item).url)
        item.should_not be_nil
        item.title.should_not be_nil
        item.description.should_not be_nil
      end      
    end
  end
end  
