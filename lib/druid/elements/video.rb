module Druid
  module Elements
    class Video < Media

    end
    Druid::Elements.type_to_class[:video] = Druid::Elements::Video
  end
end
