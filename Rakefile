require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.ruby_opts = "-I lib:spec"
  spec.pattern = 'spec/**/*_spec.rb'
end

namespace :spec do
  RSpec::Core::RakeTask.new(:html) do |spec|
    spec.ruby_opts = "-I lib:spec"
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = "--format html --out #{ENV["SPEC_REPORT"] || "specs.html"}"
  end
end

task :spec

task :lib do
  $LOAD_PATH.unshift(File.expand_xpath("lib", File.dirname(__FILE__)))
end

task :default => :spec


namespace :features do
  Cucumber::Rake::Task.new(:watir, "Run features with Watir") do |t|
    t.profile = "watir"
  end
end
