module Druid
  module Elements
    class TextField < Element

      def self.finders
        super + [:css, :tag_name, :text]
      end

    end
  end
end
