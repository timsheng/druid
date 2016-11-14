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
