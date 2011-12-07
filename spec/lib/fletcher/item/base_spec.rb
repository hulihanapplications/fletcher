require 'spec_helper'

describe Fletcher::Item::Base do
  describe "generate" do 
    
  end
  
  describe "new" do
    it "should create properly" do 
      item = described_class.new(Factory(:item).url)
      puts item.inspect
    end     
  end
end  
