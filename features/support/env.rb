require 'simplecov'
SimpleCov.start if ENV["COVERAGE"]

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'watir-webdriver'
require 'druid'

World(Druid::PageFactory)

Before do
  @driver = Watir::Browser.new :firefox if ENV['DRIVER'] == 'WATIR'
end

After do |s|
  @driver.close
end
