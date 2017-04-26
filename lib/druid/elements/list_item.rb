module Druid
  module Elements
    class ListItem < Element

    end

    Druid::Elements.tag_to_class[:li] = Druid::Elements::ListItem
  end
end
