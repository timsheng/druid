require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

namespace :features do
  Cucumber::Rake::Task.new(:watir, "Run features with Watir") do |t|
    t.profile = "watir"
  end
end
