require 'spec_helper'

describe Fletcher, :vcr do
  describe :models do 
    it "should return an array of symbols" do
     models = described_class.models
     models.is_a?(Array).should == true
    end
  end

  describe :model_classes do 
    it "should return an array of classes" do
     models = described_class.model_classes
     models.is_a?(Array).should == true
     models.first.class.should == Class
    end
  end

  context :models do 
    describe :fetch, :vcr do
      # for model in Fletcher.models
      #   it "should return valid data for #{model} model" do
      #     item = described_class.fetch(Factory(model).url)
      #     item.should_not be_nil
      #     item.name.should_not be_nil       
      #     item.description.should_not be_nil if model == :amazon
      #   end 
      # end   
    end    
  end
  
  describe :version do
    it "should return a string" do
      described_class.version.should_not be_nil
    end
  end
end  
