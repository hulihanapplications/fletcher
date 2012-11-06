require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    it "should return correct model info" do
      product = Fletcher.fetch Factory(:steam).url
      puts product.image.inspect
    end
  end 
end 

describe Fletcher::Model::Steam, :vcr do
  describe "parse" do
    context "with valid data" do
      it "should return correct model info" do
        model = described_class.new
        model.parse Fletcher::Data.read(Factory(:steam).url)
        model.doc = nil
        model.description = ''
        model.name.should_not be_nil
        model.description.should_not be_nil
        model.description.class.should == String
        model.price.should_not be_nil
        model.images.should_not be_empty
        model.image.should_not be_nil
        model.image.src.should_not be_nil
      end       
    end
  end
end