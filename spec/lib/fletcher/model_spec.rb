require 'spec_helper'

describe Fletcher::Model do
  describe "identify" do
    it "should return the model when a valid url is used" do 
      described_class.identify(FactoryGirl.build(:amazon).url).should == Fletcher::Model::Amazon
    end 

    it "should return nil when using an unsupported domain" do 
      described_class.identify(FactoryGirl.build(:invalid).url).should be_nil
    end

    # for model in Fletcher.model_classes
    #   it "should return #{model} sym when using a #{model} domain" do
    #     described_class.identify(FactoryGirl.build(model).url).should == model
    #   end 
    # end     
  end
end  
