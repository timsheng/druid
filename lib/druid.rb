require 'druid/accessors'
# Module that when included adds core functionality to a page object
module Druid
  attr_reader :driver

  # Construct a new druid.
  def initialize driver
   @driver ||= driver
  end

  def self.included(cls)
    cls.extend Druid::Accessors
  end

  # Navigate to the provided url
  def navigate_to url
    driver.goto url
  end

  # Returns the text of the current page
  def text
    driver.text
  end

  # Return the html of the current page
  def html
    driver.html
  end

  # Return the title of the current page
  def title
    driver.title
  end

end
