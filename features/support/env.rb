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
