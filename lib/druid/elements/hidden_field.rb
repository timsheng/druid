module Druid
  module Elements
    class HiddenField < Element

    end

    Druid::Elements.type_to_class[:hidden] = Druid::Elements::HiddenField
  end
end
