module Druid
  module Elements
    class Paragraph < Element

    end

    Druid::Elements.tag_to_class[:p] = Druid::Elements::Paragraph
  end
end
