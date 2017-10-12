require 'watir'
require 'druid/accessors'
require 'druid/assist'
require 'druid/page_factory'
require 'druid/element_locators'
require 'druid/page_populator'
require 'druid/section_collection'
require 'druid/javascript_framework_facade'

# require 'watir/extensions/alerts'
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
  include Assist
  include ElementLocators
  include PagePopulator
  # extend Forwardable

  def method_missing(method, *args, &block)
    @root_element.send(method, *args, &block)
  end

  def respond_to_missing?(method, include_all = false)
    @root_element && @root_element.respond_to?(method) || super
  end

  # Forward visibility checks to root so page sections can be tested for existence.
  # def_delegators :root, :visible?, :exist?


  # @return [Watir::Browser] the drvier passed to the constructor
  attr_reader :driver

  #
  # Construct a new druid. Prior to browser initialization it will call
  # a method named initialize_accessors if it exists. Upon initialization of
  # the page it will call a method named initialize_page if it exists
  #
  # @param [Watir::Browser, Watir:HTMLElement] the driver/element to use
  # @param [bool] open the page if page_url is set
  #
  def initialize(root, visit=false)
    initialize_accessors if respond_to?(:initialize_accessors)
    initialize_driver root
    goto if visit && respond_to?(:goto)
    initialize_page if respond_to?(:initialize_page)
  end

  def initialize_driver root
    @driver = root if root.is_a? Watir::HTMLElement or root.is_a? Watir::Browser
    @root_element = Elements::Element.new root if root.is_a? Watir::HTMLElement
    raise "expect Watir::Browser or Watir::HTMLElement" if not root.is_a? Watir::HTMLElement and not root.is_a? Watir::Browser
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
  # Set the default timeout for page level Waits
  #
  def self.default_page_wait=(timeout)
    @page_wait = timeout
  end

  #
  # Return the default timeout for page level Waits
  #
  def self.default_page_wait
    @page_wait ||= 30
  end

  #
  # Sets the default timeout for element level Waits
  #
  def self.default_element_wait=(timeout)
    @element_wait = timeout
  end

  #
  # Returns the default timeout for element level Waits
  #
  def self.default_element_wait
    @element_wait ||= 5
  end

  #
  # Set the javascript framework to use when determining number of
  # ajax requests. Valid frameworks are :jquery, :prototype, and :yui,
  # and :angularjs
  #
  def self.javascript_framework=(framework)
    Druid::JavascriptFrameworkFacade.framework = framework
  end

  #
  # Add a new javascript framework to druid. The module passed
  # in must adhere to the same prototype as the JQuery and Prototype
  # modules.
  #
  # @param [Symbol] the name used to reference the framework in
  # subsequent calls
  # @param [Module] a module that has the necessary methods to perform
  # the required actions.
  #
  def self.add_framework(key, framework)
    Druid::JavascriptFrameworkFacade.add_framework(key, framework)
  end
  #
  # get the current page url
  #
  def current_url
    driver.url
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
  # Waits until readyState of document is complete
  #
  # @example
  #   @page.wait
  #
  # @param [Integer] timeout
  #
  def wait(timeout = 5)
    driver.wait(timeout = 5)
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
  def wait_until(timeout = Druid.default_page_wait, message = nil, &block)
    driver.wait_until(timeout: timeout, message: message, &block)
  end

  #
  # wait until there are no pending ajax requests. This requires you to set the javascript framework in advance.
  #
  # @param [Numeric] the amount of time to wait for the block to return true.
  # @param [String] the message to include with the error if we exceed the timeout duration
  #
  def wait_for_ajax(timeout = Druid.default_page_wait, message = nil)
    end_time = ::Time.now + timeout
    until ::Time.now > end_time
      return if driver.execute_script(Druid::JavascriptFrameworkFacade.pending_requests) == 0
      sleep 1
    end
    message = "Timed out waiting for ajax requests to complete" unless message
    raise message
  end

  #
  # Override the normal alert popup so it does not occur.
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
    # switch_to_frame(frame)
    yield
    value = nil
    if driver.alert.exists?
      value = driver.alert.text
      driver.alert.ok
    end
    # switch_to_default_content(frame)
    value
  end

  #
  # Override the normal confirm popup so it does not occur
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
  # Override the normal prompt popup so it does not occur
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
  # Execute javascript on the browser
  #
  def execute_script(script, *args)
    args.map! { |e| e.kind_of?(Druid::Elements::Element) ? e.element : e }
    driver.execute_script(script, *args)
  end

  #
  # Attach to a running window. You can locate the window using either
  # the window's title or url or index, If it fails to connect to a window it will
  # pause for 1 second and try again.
  #
  # @example
  #   @page.attach_to_window(:title => "other window's title")
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

  #
  # Find the element that has focus on the page
  #
  def element_with_focus
    element = driver.execute_script("return document.activeElement")
    type = element.type.to_sym if element.tag_name.to_sym == :input
    cls = Druid::Elements.element_class_for(element.tag_name, type)
    cls.new(element)
  end

  #
  # Override the normal showModalDialog call is it opens a window instead of a dialog.
  # You will need to attach to the new window in order to continue.
  #
  # @example
  #   @page.modal_dialog do
  #     @page.action_that_spawns_the_modal
  #   end
  #
  # @param block a block that contains the call that will cause the modal dialog.
  #
  def modal_dialog(&block)
    script =
    %Q{
      window.showModalDialog = function(sURL, vArguments, sFeatures) {
        window.dialogArguments = vArguments;
        modalWin = window.open(sURL, 'modal', sFeatures);
        return modalWin;
      }
    }
    driver.execute_script script
    yield if block_given?
  end

  #
  # Handle cookies
  #
  # @return [Watir::Cookies]
  #
  def cookies
    driver.cookies
  end

  #
  # Save the current screenshot to the provided path. File is saved as a png file.

  def save_screenshot(file_name)
    driver.screenshot.save(file_name)
  end

  #
  # Identify an element as existing within a frame. A frame parameter is
  # passed to the block and must be passed to the other calls to Druid.
  # You can nest calls to in_frame by passing the frame to the next level.
  #
  # @example
  #  @page.in_frame(:id => 'frame_id') do |frame|
  #    @page.text_field_element(:id=> 'fname', :frame => frame)
  #  end
  #
  # @param [Hash] identifier how we find the frame. The valid keys are:
  #    * :id
  #    * :index
  #    * :name
  # @param block that contains the calls to elements that exist inside the frame.
  #
  def in_frame(identifier, frame=nil, &block)
    frame = [] if frame.nil?
    frame << {frame: identifier}
    block.call(frame)
  end

  #
  # Identify an element as existing within an iframe. Aframe parameter is
  # passed to the block and must be passed to the other calls to Druid.
  # You can nest calls to in_iframe by passing the frame to the next level.
  #
  # @example
  #  @page.in_iframe(:id => 'frame_id') do |frame|
  #    @page.text_field_element(:id=> 'fname', :frame => frame)
  #  end
  #
  # @param [Hash] identifier how we find the frame. The valid keys are:
  #    * :id
  #    * :index
  #    * :name
  # @param block that contains the calls to elements that exist inside the frame.
  #
  def in_iframe(identifier, frame=nil, &block)
    frame = [] if frame.nil?
    frame << {iframe: identifier}
    block.call(frame)
  end

  def switch_to_frame(frame_identifiers)
    unless frame_identifiers.nil?
      frame_identifiers.each do |frame|
        frame_id = frame.values.first
        value = frame_id.values.first
        driver.wd.switch_to.frame(value)
      end
    end
  end

  def call_block(&block)
    block.arity == 1 ? block.call(self) : self.instance_eval(&block)
  end

  private

  def root
    @root_element || driver
  end

end
