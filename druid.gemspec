# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "druid/version"

Gem::Specification.new do |s|
  s.name = "druid-ts"
  s.platform = Gem::Platform::RUBY
  s.version = Druid::VERSION
  s.date = '2016-11-15'
  s.authors = ["Tim Sheng"]
  s.email = ["278570038@qq.com"]
  s.homepage = "http://github.com/timsheng/druid"
  s.summary = %q{Druid DSL for browser testing}
  s.description = %q{Druid DSL that works with Watir}
  s.license = 'MIT'
  s.rubyforge_project = "druid"
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f)}
  s.require_paths = ["lib"]

  s.add_dependency "watir-webdriver", ">= 0.9.1"
  s.add_development_dependency "rspec", ">= 3.4.0"
  s.add_development_dependency "cucumber", ">= 1.3.20"
end
