require File.expand_path("../../lib/fletcher", __FILE__)

# Include Factories
require "factory_girl"
require 'vcr'
Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each {|f| require f}

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}