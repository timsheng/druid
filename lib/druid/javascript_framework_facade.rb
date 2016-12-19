require 'druid/javascript/jquery'
require 'druid/javascript/prototype'

module Druid
  module JavascriptFrameworkFacade

    class << self
      def framework=(framework)
        @framework = framework
      end

      def framework
        @framework
      end

      def script_builder
        initialize_script_builder unless @builder
        @builder[@framework]
      end

      def pending_requests
        script_builder.pending_requests
      end

      private

      def initialize_script_builder
        @builder = {
          :jquery => Druid::Javascript::JQuery,
          :prototype => Druid::Javascript::Prototype
        }
      end

    end
  end
end
