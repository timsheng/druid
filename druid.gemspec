# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "druid/version"

message =
"""
This version of the gem moves to using the new Watir gem and away from
using Watir Webdriver. You will need to update you Gemfile to use `watir`
instead of `watir-webdriver` and update any `require` statements in your
code.
This is an important move as Watir Webdriver will not be supported any
longer. All new development has been moved to Watir.  There are also
significant benefits to this move.  See the Watir site at
https://watir.github.io for more details.
"""

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
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(pkg|spec|features|coverage)/})}
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f)}
  s.require_paths = ["lib"]
  s.post_install_message = message
  s.add_dependency "watir", "~> 6.0"
  s.add_dependency "page_navigation", ">= 0.10"
  s.add_dependency "net-http-persistent", "~> 2.9.4"

  s.add_development_dependency "rspec", ">= 3.0.0"
  s.add_development_dependency "cucumber", ">= 2.0.0"
  s.add_development_dependency "rack", ">= 1.0"
end
