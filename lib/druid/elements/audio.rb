module Druid
  module Elements
    class Audio < Media

    end

    Druid::Elements.type_to_class[:audio] = Druid::Elements::Audio
  end
end
