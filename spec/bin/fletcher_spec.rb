require "spec_helper"
#bin_path = File.expand_path("../../../bin/fletcher", __FILE__)
load File.expand_path("../../../bin/fletcher", __FILE__)

def mock_terminal
  @input = StringIO.new
  @output = StringIO.new
  $terminal = HighLine.new @input, @output
end

describe "Fletcher CLI" do
  before :each do
    mock_terminal
  end 

  # describe "fetch command", :vcr do
  #   before :each do
  #     @command = command :fetch
  #   end 

  #   it "should return prompt without url" do 
  #     @command.run Factory(:amazon).url
  #     # @output.to_s.should == @command.syntax
  #   end 

  #   it "works with valid product url" do 
  #     lambda{ 
  #       @command.run Factory(:amazon).url
  #     }.should_not raise_error 
  #   end 
  # end 

  # describe "websites command" do
  #   before :each do
  #     @command = command :websites
  #   end 

  #   it "should work without any errors" do
  #     lambda{@command.run}.should_not raise_error 
  #   end 
  # end
end 