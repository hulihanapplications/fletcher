require 'spec_helper'

describe Fletcher::Nokogiri::HTML::Document do

end  

describe Fletcher::Nokogiri::XML::NodeSet do
  before :each do 
    @doc = Fletcher::Data.read(Factory(:valid).url)
  end  
   
  describe "first_string" do
    it "should return a valid string" do
      nodeset = @doc.xpath(Factory(:valid).title_xpath)
      string = nodeset.first_string
      string.should_not be_nil 
    end   
  end 
  
  describe "attribute_array" do
    it "should return an array of attribute hashes" do
      nodeset = @doc.xpath(Factory(:valid).images_xpath)
      attribute_array = nodeset.attribute_array 
      attribute_array.class.should == Array
    end       
  end
end 
