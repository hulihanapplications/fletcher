require 'spec_helper'

describe Fletcher do
  context :models do 
    describe :itendify_model do
      it "should raise an error when using an unsupported domain" do 
        lambda{described_class.identify_model(Factory(:invalid).url)}.should raise_error 
      end

      for model in Fletcher.models
        it "should return #{model} sym when using a #{model} domain" do
          described_class.identify_model(Factory(model).url).should == model
        end 
      end   
    end 

    describe :fetch do
      for model in [Fletcher.models[2]]
        it "should return valid data for #{model} model" do
          model = described_class.fetch(Factory(model).url)
          model.should_not be_nil
          model.name.should_not be_nil       
          model.description.should_not be_nil if model == :amazon
        end 
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
