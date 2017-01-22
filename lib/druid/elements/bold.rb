module Druid
  module Elements
    class Bold < Element

    end
    Druid::Elements.tag_to_class[:b] = Druid::Elements::Bold
  end
end
