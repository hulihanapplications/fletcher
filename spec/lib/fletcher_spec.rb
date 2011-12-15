require 'spec_helper'

describe Fletcher do
  describe :service do
    it "should raise an error when using an unsupported domain" do 
      lambda{described_class.identify_service(Factory(:item).url)}.should raise_error 
    end
    
    it "should return :amazon when using an amazon domain" do 
      described_class.identify_service(Factory(:amazon_item).url).should == :amazon
    end    
    
    it "should return :ebay when using an ebay domain" do 
      described_class.identify_service(Factory(:ebay_item).url).should == :ebay
    end        
  end
  
  describe :fetch do 
    context :amazon do 
      it "should fetch amazon item info successfully" do 
        item = described_class.fetch(Factory(:amazon_item).url)
        item.should_not be_nil
        item.name.should_not be_nil
        item.description.should_not be_nil
      end      
    end
    
    context :ebay do 
      it "should fetch item info successfully" do 
        item = described_class.fetch(Factory(:ebay_item).url)
        item.should_not be_nil
        item.name.should_not be_nil
      end      
    end    

    context :thinkgeek do 
      it "should fetch item info successfully" do 
        item = described_class.fetch(Factory(:thinkgeek_item).url)
        item.should_not be_nil
        item.name.should_not be_nil
      end      
    end    
    
    context :etsy do 
      it "should fetch item info successfully" do 
        item = described_class.fetch(Factory(:etsy_item).url)
        item.should_not be_nil
        item.name.should_not be_nil
      end      
    end        
  end
end  
