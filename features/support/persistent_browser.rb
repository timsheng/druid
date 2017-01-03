module Druid
  module PersistantBrowser
    @@driver = false
    def self.get_browser
      if !@@driver
        target_browser = ENV['BROWSER'].to_sym
        @@driver = Watir::Browser.new target_browser if ENV['DRIVER'] == 'WATIR'
      end
      @@driver
    end

    def self.quit
      @@driver.quit
    end
  end
end
