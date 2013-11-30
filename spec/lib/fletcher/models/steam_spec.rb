require 'spec_helper'

describe Fletcher, :vcr do
  describe :fetch, :vcr do
    it "should return correct model info" do
      product = Fletcher.fetch FactoryGirl.build(:steam).url
    end
  end 
end 

def steam_check(url)
  model = described_class.new
  model.parse Fletcher::Data.read(url)    
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

describe Fletcher::Model::Steam, :vcr do
  describe "parse" do
    context "with valid data" do
      %w{steam}.each do |name|
        it "should fetch valid info for #{name}" do 
          steam_check(FactoryGirl.build(name.to_sym).url)
        end         
      end     

      it "should fetch valid info for game with agecheck" do
        model = described_class.new
        model.parse Fletcher::Data.read(FactoryGirl.build(:steam_agecheck).url)    
        model.name.should_not be_nil
        model.images.should_not be_empty
        model.image.should_not be_nil
        model.image.src.should_not be_nil            
      end 
    end
  end
end