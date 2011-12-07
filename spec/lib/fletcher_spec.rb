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
      it "should retrieve amazon item info successfully" do 
        described_class.fetch(Factory(:amazon_item).url).should != nil        
      end      
    end
  end
end  
