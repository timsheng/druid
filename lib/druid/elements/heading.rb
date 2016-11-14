module Druid
  module Elements
     class Heading < Element

     end

     Druid::Elements.tag_to_class[:h1] = Druid::Elements::Heading
     Druid::Elements.tag_to_class[:h2] = Druid::Elements::Heading
     Druid::Elements.tag_to_class[:h3] = Druid::Elements::Heading
     Druid::Elements.tag_to_class[:h4] = Druid::Elements::Heading
     Druid::Elements.tag_to_class[:h5] = Druid::Elements::Heading
     Druid::Elements.tag_to_class[:h6] = Druid::Elements::Heading
  end
end
