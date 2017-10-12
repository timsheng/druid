module Druid
  module Elements
    class FileField < Element

    end

    Druid::Elements.type_to_class[:file] = Druid::Elements::FileField
  end
end
