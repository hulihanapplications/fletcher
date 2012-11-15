require 'spec_helper'

describe Fletcher::Nokogiri::HTML::Document do

end  

describe Fletcher::Nokogiri::XML::NodeSet, :vcr do
  before :each do 
    @doc = Fletcher::Data.read(FactoryGirl.build(:valid).url)
  end  
   
  describe "first_string", :vcr do
    it "should return a valid string" do
      nodeset = @doc.xpath(FactoryGirl.build(:valid).title_xpath)
      string = nodeset.first_string
      string.should_not be_nil 
    end   
  end 
  
  describe "attribute_array", :vcr do
    it "should return an array of attribute hashes" do
      nodeset = @doc.xpath(FactoryGirl.build(:valid).images_xpath)
      attribute_array = nodeset.attribute_array 
      attribute_array.class.should == Array
    end       
  end
end 
