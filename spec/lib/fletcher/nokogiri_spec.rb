require 'spec_helper'

describe Fletcher::Nokogiri::HTML::Document do

end  

describe Fletcher::Nokogiri::XML::NodeSet do
  before :each do 
    @doc = Fletcher::Data.read(Factory(:valid_item).url)
  end  
   
  describe "first_string" do
    it "should return a valid string" do
      nodeset = @doc.xpath(Factory(:valid_item).title_xpath)
      string = nodeset.first_string
      string.should_not be_nil 
    end   
  end 
  
  describe "attribute_array" do
    it "should return an array of attribute hashes" do
      nodeset = @doc.xpath(Factory(:valid_item).images_xpath)
      attribute_array = nodeset.attribute_array 
      puts attribute_array.first.inspect
    end       
  end
end 
