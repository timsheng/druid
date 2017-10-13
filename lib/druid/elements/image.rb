module Druid
  module Elements
    class Image < Element

    end

    Druid::Elements.tag_to_class[:img] = Druid::Elements::Image
  end
end
