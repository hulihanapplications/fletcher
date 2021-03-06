# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: fletcher 0.6.9 ruby lib

Gem::Specification.new do |s|
  s.name = "fletcher"
  s.version = "0.6.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dave Hulihan", "Hulihan Applications"]
  s.date = "2014-05-12"
  s.description = "Easily fetch product information from third party websites such as Amazon, Steam, eBay, etc."
  s.email = "dave@hulihanapplications.com"
  s.executables = ["fletcher"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/fletcher",
    "config/locales/fletcher.en.yml",
    "fletcher.gemspec",
    "lib/fletcher.rb",
    "lib/fletcher/cli/utility.rb",
    "lib/fletcher/data.rb",
    "lib/fletcher/model.rb",
    "lib/fletcher/models/amazon.rb",
    "lib/fletcher/models/base.rb",
    "lib/fletcher/models/ebay.rb",
    "lib/fletcher/models/etsy.rb",
    "lib/fletcher/models/gamecouk.rb",
    "lib/fletcher/models/googleshopping.rb",
    "lib/fletcher/models/newegg.rb",
    "lib/fletcher/models/playcom.rb",
    "lib/fletcher/models/steam.rb",
    "lib/fletcher/models/thinkgeek.rb",
    "lib/fletcher/nokogiri.rb",
    "lib/fletcher/string.rb",
    "spec/bin/fletcher_spec.rb",
    "spec/factories/models.rb",
    "spec/lib/fletcher/data_spec.rb",
    "spec/lib/fletcher/model_spec.rb",
    "spec/lib/fletcher/models/amazon_spec.rb",
    "spec/lib/fletcher/models/base_spec.rb",
    "spec/lib/fletcher/models/ebay_spec.rb",
    "spec/lib/fletcher/models/etsy_spec.rb",
    "spec/lib/fletcher/models/gamecouk_spec.rb",
    "spec/lib/fletcher/models/googleshopping_spec.rb",
    "spec/lib/fletcher/models/newegg_spec.rb",
    "spec/lib/fletcher/models/playcom_spec.rb",
    "spec/lib/fletcher/models/steam_spec.rb",
    "spec/lib/fletcher/models/thinkgeek_spec.rb",
    "spec/lib/fletcher/nokogiri_spec.rb",
    "spec/lib/fletcher/string_spec.rb",
    "spec/lib/fletcher_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/benchmark.rb",
    "spec/support/vcr.rb",
    "spec/vcr/ebay_fetch.yml",
    "spec/vcr/ebay_model.yml",
    "test/helper.rb",
    "test/test_fletcher.rb"
  ]
  s.homepage = "http://github.com/hulihanapplications/fletcher"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "A cross-website product/model information fetcher."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<money>, [">= 0"])
      s.add_runtime_dependency(%q<monetize>, [">= 0"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, [">= 0"])
      s.add_development_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
    else
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<money>, [">= 0"])
      s.add_dependency(%q<monetize>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<factory_girl>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
    end
  else
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<money>, [">= 0"])
    s.add_dependency(%q<monetize>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<factory_girl>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
  end
end

