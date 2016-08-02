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
  module PageFactory
    # attr_accessor :page
    #
    # Create and navigate to a page object.  The navigation will only work if the
    # 'page_url' method was call on the page object.
    #
    # @param [page_class] a class that has included the Druid module
    # @param an optional block to be called
    # @return [PageObject] the newly created page object
    #
    def visit_page(page_class, &block)
      on_page page_class, true, &block
    end
    #
    # Create a page object.
    #
    # @param [page_class] a class that has included the Druid module
    # @param [Bool] should the page be visited?  default is false.
    # @param an optional block to be called
    # @return [PageObject] the newly created page object
    #
    def on_page(page_class, visit=false, &block)
      @current_page = page_class.new(@driver, visit)
      yield @current_page if block_given?
      @current_page
    end
    # def visit_page(page_class, &block)
    #   page = page_class.new(@driver, true)
    #   yield page if block_given?
    #   page
    # end
    #
    # def on_page(page, &block)
    #   yield page if block_given?
    #   page
    # end
  end
end
