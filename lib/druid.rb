require 'druid/accessors'
require 'druid/page_factory'

#
# Module that when included adds functionality to a page object.  This module
# will add numerous class and instance methods that you use to define and
# interact with web pages.
#
# If we have a login page with a username and password textfield and a login
# button we might define our page like the one below.  We can then interact with
# the object using the generated methods.
#
# @example Login page example
#   class LoginPage
#     include Druid
#
#     text_field(:username, :id => 'user')
#     text_field(:password, :id => 'pass')
#     button(:login, :value => 'Login')
#   end
#
#   ...
#
#   browser = Watir::Browser.new :firefox
#   login_page = LoginPage.new(browser)
#   login_page.username = 'tim'
#   login_page.password = 'sheng'
#   login_page.login
#
# @see Druid::Accessors to see what class level methods are added to this module at runtime.
#
module Druid
  attr_reader :driver

  # Construct a new druid.
  def initialize(driver, visit=false)
   @driver ||= driver
   goto if visit && respond_to?(:goto)
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
