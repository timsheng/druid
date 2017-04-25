module Druid
  module Elements
    class Link < Element

    end

    Druid::Elements.tag_to_class[:a] = Druid::Elements::Link
  end
end
