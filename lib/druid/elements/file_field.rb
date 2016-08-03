module Druid
  module Elements
    class FileField < Element
      def self.finders
        super + [:title]
      end
    end
  end
end
