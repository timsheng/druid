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
  # @return [Watir::Browser] the drvier passed to the constructor
  attr_reader :driver
  #
  # Construct a new druid.
  #
  # @param [Watir::Browser] the driver to use
  #
  def initialize(driver, visit=false)
    if driver.is_a? Watir::Browser
      @driver ||= driver
      goto if visit && respond_to?(:goto)
    else
      raise ArgumentError, "expect Watir::Browser"
    end
  end

  # @private
  def self.included(cls)
    cls.extend Druid::Accessors
  end

  #
  # navigate to the provided url
  #
  # @param [String] the full url to navigate to
  #
  def navigate_to url
    driver.goto url
  end

  #
  # Returns the text of the current page
  #
  def text
    driver.text
  end

  #
  # Returns the html of the current page
  #
  def html
    driver.html
  end

  #
  # Returns the title of the current page
  #
  def title
    driver.title
  end

end
