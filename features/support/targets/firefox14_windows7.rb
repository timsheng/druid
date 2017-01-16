require 'selenium-webdriver'
require 'selenium/webdriver/remote/http/persistent'
require 'watir-webdriver'

module Target
  def desired_capabilities
    capabilities(:firefox, '14', 'Windows 2008', 'Testing page-object with Firefox 15 on Windows 7')
  end
end
