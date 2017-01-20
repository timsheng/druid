require 'page_navigation'

module Druid
  #
  # Module to facilitate to creating of page objects in step definitions.  You
  # can make the methods below available to all of your step definitions by adding
  # this module to World.  This idea was first discussed in Alister Scott's blog
  # entry http://watirmelon.com/2011/06/07/removing-local-page-references-from-cucumber-steps/.
  #
  # @example Making the PageFactory available to your step definitions
  #   World Druid::PageFactory
  #
  # @example Visiting a page for the first time in a Scenario
  #   visit_page MyPageObject do |page|
  #     page.name = 'Tim'
  #   end
  #
  # @example using a page that has already been visited in a Scenario
  #   on_page MyPageObject do |page|
  #     page.name.should == 'Tim'
  #   end
  #
  # If you plan to use the navigate_to method you will need to ensure you setup the possible
  # routes ahead of time. You must always have a default route in order for this to work. Here
  # is an example of how you define routes:
  #
  # @example Example routes defined in env.rb
  #  Druid::PageFactory.routes = {
  #    :default => [[PageOne,:method1], [PageTwoA,:method2], [PageThree,:method3],
  #    :another_route => [[PageOne,:method1,"arg1"], [PageTwoB,:method2b], [PageThree,:method3]]
  #   }
  # Notice the first entry of :another_route is passing an argument
  # to the method
  # You must also call the navigation_method on each page.
  module PageFactory
    include PageNavigation
    # attr_accessor :page
    #
    # Create and navigate to a page object.  The navigation will only work if the
    # 'page_url' method was call on the page object.
    #
    # @param [PageObject, String] a class that has included the
    # Druid module or a string containing the name of the class
    # @param Hash values that is pass through to page class a
    # available in the @params instance variable
    # @param an optional block to be called
    # @return [PageObject] the newly created page object
    #
    def visit_page(page_class, params={:using_params => {}}, &block)
      on_page page_class, params, true, &block
    end

    # Support 'visit' for readability of usage
    alias_method :visit, :visit_page
    #
    # Create a page object.
    #
    # @param [PageObject, String] a class that has included the Druid module or a string containing the name of the class
    # @param  Hash values that is pass through to page class a
    # available in the @params instance variable.
    # @param [Bool] should the page be visited?  default is false.
    # @param an optional block to be called
    # @return [PageObject] the newly created page object
    #
    def on_page(page_class, params={:using_params => {}}, visit=false, &block)
      page_class = class_from_string(page_class) if page_class.is_a? String
      return super(page_class, params, visit, &block) unless page_class.ancestors.include? Druid
      merged = page_class.params.merge(params[:using_params])
      page_class.instance_variable_set("@merged_params", merged) unless merged.empty?
      @current_page = page_class.new(@driver, visit)
      block.call @current_page if block
      @current_page
    end

    # Support 'on' for readability of usage
    alias_method :on, :on_page

    #
    # Create a page object if and only if the current page is the same page to be created
    #
    # @example
    #  original:
    #   on_page(NewProduct).save if @current_page.class == NewProduct
    #   on_page(EditProduct).save if @current_page.class == EditProduct
    #  new:
    #   if_page NewProduct do |page|
    #      page.save
    #   end
    #   if_page EditProduct do |page|
    #      page.update
    #   end
    # @param [PageObject, String] a class that has included the Druid module or a string containing the name of the class
    # @param Hash values that is pass through to page class a
    # available in the @params instance variable
    # @param [block] an optional block to be called
    # @return [PageObject] the newly created page object
    def if_page(page_class, params={:using_params => {}}, &block)
      page_class = class_from_string(page_class) if page_class.is_a? String
      return @current_page unless @current_page.class == page_class
      on_page(page_class, params, false, &block)
    end

    # support 'if' for readability of usage
    alias_method :if, :if_page

    private

    def class_from_string(str)
      str.split('::').inject(Object) do |mod, class_name|
        mod.const_get(class_name)
      end
    end

  end
end
