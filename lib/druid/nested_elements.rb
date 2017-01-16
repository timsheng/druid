require 'druid/locator_generator'

module Druid
  module NestedElements

    def self.included(cls)
      Druid::LocatorGenerator.generate_locators(cls)
    end

    private

    def locator(identifier)
      identifier[0] ? identifier[0] : {:index => 0}
    end

    # [:text_field,
    #  :hidden_field,
    #  :text_area,
    #  :select_list,
    #  :link,
    #  :checkbox,
    #  :radio_button,
    #  :button,
    #  :div,
    #  :span,
    #  :table,
    #  :cell,
    #  :image,
    #  :form,
    #  :list_item,
    #  :unordered_list,
    #  :ordered_list,
    #  :h1,
    #  :h2,
    #  :h3,
    #  :h4,
    #  :h5,
    #  :h6,
    #  :paragraph,
    #  :label,
    #  :file_field,
    #  :area,
    #  :canvas,
    #  :audio,
    #  :video].each do |tag|
    #    define_method("#{tag.to_s}_element") do |*identifier|
    #      self.send "#{tag.to_s}_for", locator(identifier)
    #    end
    #
    #    define_method("#{tag.to_s}_elements") do |*identifier|
    #      self.send "#{tag.to_s}s_for", locator(identifier)
    #    end
    #  end

  end
end
