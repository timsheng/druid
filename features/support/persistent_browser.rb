module Druid
  module PersistantBrowser
    @@driver = false
    def self.get_browser
      if !@@driver
        target = ENV['BROWSER']
        target = 'firefox_local' unless target

        require File.dirname(__FILE__) + "/targets/#{target}"
        extend Target

        @@driver = watir_browser if ENV['DRIVER'] == 'WATIR'
      end
      @@driver
    end

    def self.quit
      @@driver.quit
    end
  end
end
