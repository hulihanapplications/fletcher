require 'spec_helper'

describe Fletcher do
  describe :service do
    it "should raise an error when using an unsupported domain" do 
      lambda{described_class.service(Factory(:item).url)}.should raise_error 
    end
    
    it "should return :amazon when using an amazon domain" do 
      described_class.service(Factory(:amazon_item).url).should == :amazon
    end    
  end
  
  describe :fetch do 
    context :amazon do 
      it "should fetch amazon item info successfully" do 
        item = described_class.fetch(Factory(:amazon_item).url)
        item.should != nil
        item.title.should != nil        
      end      
    end
  end
end  
