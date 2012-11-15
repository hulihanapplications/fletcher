require 'spec_helper'

describe Fletcher::Model do
  describe "identify" do
    it "should return the model when a valid url is used" do 
      described_class.identify(Factory(:amazon).url).should == Fletcher::Model::Amazon
    end 

    it "should raise an error when using an unsupported domain" do 
      lambda{described_class.identify_model(Factory(:invalid).url)}.should raise_error 
    end

    for model in Fletcher.models
      it "should return #{model} sym when using a #{model} domain" do
        described_class.identify_model(Factory(model).url).should == model
      end 
    end     
  end
end  
