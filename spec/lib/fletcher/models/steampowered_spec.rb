require 'spec_helper'

describe Fletcher::Model::Steampowered do
  describe "parse" do
    context "with valid data" do
      it "should return correct model info" do
        model = described_class.new
        model.parse Fletcher::Data.read(Factory(:steampowered).url)
        model.doc = nil
        model.description = ''
        model.name.should_not be_nil
        model.description.should_not be_nil
        model.description.class.should == String
        model.price.should_not be_nil
        model.image.should_not be_nil
        model.images.should_not be_empty
      end       
    end
  end
end