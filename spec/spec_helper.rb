require "druid"
require "watir-webdriver"

def mock_driver
  driver = double('watir')
  allow(driver).to receive(:is_a?).with(anything()).and_return(false)
  allow(driver).to receive(:is_a?).with(Watir::Browser).and_return(true)
  driver
end
