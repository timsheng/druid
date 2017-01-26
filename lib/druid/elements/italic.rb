module Druid
  module Elements
    class Italic < Element

    end

    Druid::Elements.tag_to_class[:i] = Druid::Elements::Italic
  end
end
