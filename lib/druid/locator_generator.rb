module Druid
  module LocatorGenerator

    BASIC_ELEMENTS = [:abbr,
                      :address,
                      :article,
                      :aside,
                      :bdi,
                      :cite,
                      :code,
                      :dd,
                      :em,
                      :figcaption,
                      :figure,
                      :footer,
                      :header,
                      :hgroup,
                      :kbd,
                      :mark,
                      :nav,
                      :noscript,
                      :rp,
                      :rt,
                      :ruby,
                      :samp,
                      :section,
                      :sub,
                      :summary,
                      :sup,
                      :var,
                      :wbr]

    ADVANCED_ELEMENTS = [:text_field,
                         :hidden_field,
                         :text_area,
                         :select_list,
                         :link,
                         :checkbox,
                         :radio_button,
                         :button,
                         :div,
                         :span,
                         :table,
                         :cell,
                         :image,
                         :form,
                         :list_item,
                         :unordered_list,
                         :ordered_list,
                         :h1,
                         :h2,
                         :h3,
                         :h4,
                         :h5,
                         :h6,
                         :paragraph,
                         :label,
                         :file_field,
                         :area,
                         :canvas,
                         :audio,
                         :video,
                         :svg]

    def self.generate_locators(target)
       ADVANCED_ELEMENTS.each do |tag|
         target.send(:define_method, "#{tag.to_s}_element") do |*identifier|
           self.send "#{tag.to_s}_for", locator(identifier).clone
         end

         target.send(:define_method, "#{tag.to_s}_elements") do |*identifier|
           self.send "#{tag.to_s}s_for", identifier[0] ? identifier[0].clone : {}
         end
       end

       BASIC_ELEMENTS.each do |tag|
         target.send(:define_method, "#{tag.to_s}_element") do |*identifier|
           self.send :element_for, tag, locator(identifier)
         end

         target.send(:define_method, "#{tag.to_s}_elements") do |*identifier|
           self.send(:elements_for, tag, identifier[0] ? identifier[0] : {})
         end
       end
    end
  end
end
