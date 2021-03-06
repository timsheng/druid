require 'druid/javascript/jquery'
require 'druid/javascript/prototype'
require 'druid/javascript/yui'
require 'druid/javascript/angularjs'

module Druid
  #
  # Provide hooks into different common Javascript Frameworks.
  # Currently this module only supports jQuery and Prototype but it
  # has ability for you to plug your own framework into it and
  # therefore have it work with this gem. You do this by calling the
  # #add_framework method. The module you provide must implement the
  # necessary methods. Please look at the jQuery or Prototype
  # implementations to determine the necessary methods
  #
  module JavascriptFrameworkFacade

    class << self
      #
      # Set the framework to use
      #
      # @param [Symbol] the framework to use. :jquery and :prototype, :yui,
      # and :angularjs are supported
      #
      def framework=(framework)
        initialize_script_builder unless @builder
        raise unknown_framework(framework) unless @builder[framework]
        @framework = framework
      end

      def add_framework(key, value)
        raise invalid_framework unless value.respond_to? :pending_requests
        initialize_script_builder unless @builder
        @builder[key] = value
      end

      #
      # Get the framework that will be used
      #
      def framework
        @framework
      end

      def script_builder
        initialize_script_builder unless @builder
        @builder[@framework]
      end

      #
      # get the javascript to determine number of pending requests
      #
      def pending_requests
        script_builder.pending_requests
      end

      private

      def initialize_script_builder
        @builder = {
          :jquery => Druid::Javascript::JQuery,
          :prototype => Druid::Javascript::Prototype,
          :yui => Druid::Javascript::YUI,
          :angularjs => Druid::Javascript::AngularJS
        }
      end

      def unknown_framework(framework)
        "You specified the Javascript framework #{framework} and it is unknown to the system"
      end

      def invalid_framework
        "The Javascript framework you provided does not implement the necessary methods"
      end
    end
  end
end
