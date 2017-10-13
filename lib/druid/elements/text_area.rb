module Druid
  module Elements
    class TextArea < Element

    end

    Druid::Elements.tag_to_class[:textarea] = Druid::Elements::TextArea

  end
end
