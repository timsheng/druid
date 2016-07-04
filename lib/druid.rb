require 'druid/accessors'
require 'druid/page_factory'
# require 'watir-webdriver/extensions/alerts'
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
  # include Watir::AlertHelper
  # @return [Watir::Browser] the drvier passed to the constructor
  attr_reader :driver
  #
  # Construct a new druid. Upon initialization of the page it will call a method named
  # initialize_page if it exists
  #
  # @param [Watir::Browser] the driver to use
  # @param [bool] open the page if page_url is set
  #
  def initialize(driver, visit=false)
    if driver.is_a? Watir::Browser
      @driver ||= driver
      initialize_page if respond_to?(:initialize_page)
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

  #
  # Refresh current page
  #
  def refresh
    driver.refresh
  end

  #
  # Go back to the previous page
  #
  def back
    driver.back
  end

  #
  # Go forward to the next page
  #
  def forward
    driver.forward
  end
  #
  # Wait until the block returns true or times out
  #
  # @example
  #   @page.wait_until(5, 'Success not found on page') do
  #     @page.text.include? 'Success'
  #   end
  #
  # @param [Numeric] the amount of time to wait for the block to return true
  # @param [String] the message to include with the error if we exceed the timeout duration
  # @param block the block to execute. It should return true when successful.
  #
  def wait_until(timeout = 30, message = nil, &block)
    driver.wait_until(timeout, message, &block)
  end

  #
  # Override the normal alert popup so it does not occurr.
  #
  # @example
  #   message = @page.alert do
  #     @page.button_that_causes_alert
  #   end
  #
  # @param block a block that has the call that will cause the alert to display
  # @return [String] the message that was contained in the alert
  #
  def alert(&block)
    yield
    value = nil
    if driver.alert.exists?
      value = driver.alert.text
      driver.alert.ok
    end
    value
  end

  #
  # Override the normal confirm popup so it does not occurr
  #
  # @example
  #   message = @popup.confirm(true) do
  #     @page.button_that_causes_confirm
  #   end
  #
  # @param [boolean] what response you want to return back from the confirm popup
  # @param block a block that has the call that will cause the confirm to display
  # @return [String] the message that was contained in the confirm
  #
  def confirm(response, &block)
    yield
    value = nil
    if driver.alert.exists?
      value = driver.alert.text
      response ? driver.alert.ok : driver.alert.close
    end
    value
  end

  #
  # Override the normal prompt popup so it does not occurr
  #
  # @example
  #   message = @popup.prompt("Some Value") do
  #     @page.button_that_causes_prompt
  #   end
  #
  # @param [String] the value will be setted in the prompt field
  # @param block a block that has the call that will cause the prompt to display
  # @return [String] the message that was contained in the prompt
  #
  def prompt(answer, &block)
    yield
    value = nil
    if driver.alert.exists?
      value = driver.alert.text
      driver.alert.set answer
      driver.alert.ok
    end
    value
  end

  #
  # Attach to a running window. You can locate the window using either
  # the window's title or url or index, If it failes to connect to a window it will
  # pause for 1 second and try again.
  #
  # @example
  #   page.attach_to_window(:title => "other window's title")
  #
  # @param [Hash] either :title or :url or index of the other window. The url does not need to
  # be the entire url - it can just be the page name like index.html
  #
  def attach_to_window(identifier, &block)
    if identifier.keys.first == :url
      win_id = {identifier.keys.first => /#{Regexp.escape(identifier.values.first)}/}
    else
      win_id = {identifier.keys.first => identifier.values.first}
    end
    begin
      driver.window(win_id).use &block
    rescue
      sleep 1
      driver.window(win_id).use &block
    end
  end

  def nested_frames(frame_identifiers)
    return if frame_identifiers.nil?
    frame_str = ''
    frame_identifiers.each do |id|
      value = id.values.first
      frame_str += "frame(:#{id.keys.first} => #{value})." if value.to_s.is_integer
      frame_str += "frame(:#{id.keys.first} => '#{value}')." unless value.to_s.is_integer
    end
    frame_str
  end
end
