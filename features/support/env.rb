require 'simplecov'
SimpleCov.start if ENV["COVERAGE"]

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'watir-webdriver'
require 'druid'

World(Druid::PageFactory)

Before do
  @driver = Druid::PersistantBrowser.get_browser
end


at_exit do
  Druid::PersistantBrowser.quit
end

module Druid
  module PersistantBrowser
    @@driver = false
    def self.get_browser
      if !@@driver
        @@driver = Watir::Browser.new :firefox if ENV['DRIVER'] == 'WATIR'
      end
      @@driver
    end

    def self.quit
      @@driver.quit
    end
  end
end
