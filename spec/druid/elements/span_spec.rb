require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Span do
  describe "interface" do
    it "should register with tag_name :span" do
      expect(Druid::Elements.element_class_for(:span)).to be Druid::Elements::Span
    end
  end
end
