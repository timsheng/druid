module Druid
  module Elements
    class TextField < Element

    end

    Druid::Elements.type_to_class[:text] = Druid::Elements::TextField
    Druid::Elements.type_to_class[:password] = Druid::Elements::TextField

  end
end
